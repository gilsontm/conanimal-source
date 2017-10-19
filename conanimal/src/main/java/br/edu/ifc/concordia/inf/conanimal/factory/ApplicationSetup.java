package br.edu.ifc.concordia.inf.conanimal.factory;

import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.ejb.Startup;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.event.Observes;
import javax.inject.Inject;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletContext;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.jboss.logging.Logger;

import br.com.caelum.vraptor.boilerplate.HibernateDAO;
import br.com.caelum.vraptor.boilerplate.factory.SessionFactoryProducer;
import br.com.caelum.vraptor.boilerplate.factory.SessionManager;
import br.com.caelum.vraptor.boilerplate.util.CryptManager;
import br.edu.ifc.concordia.inf.conanimal.model.Contact;
import br.edu.ifc.concordia.inf.conanimal.model.ImageMainPage;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@ApplicationScoped
@Startup
public class ApplicationSetup {

	private static final Logger LOG = Logger.getLogger(ApplicationSetup.class);

	protected ApplicationSetup() {
	}

	public void initializeAtStartup(@Observes ServletContext context) {

	}

	@Inject
	public ApplicationSetup(SessionFactoryProducer factoryProducer) {
		factoryProducer.initialize("hibernate.cfg.xml");
		
		CryptManager.updateKey(SystemConfigs.getConfig("crypt.key"));
		CryptManager.updateSalt("@2o!A", "70Px$");

		SessionManager mngr = new SessionManager(factoryProducer.getInstance());
		HibernateDAO dao = new HibernateDAO(mngr);
		
		Criteria userCriteria = dao.newCriteria(User.class);
		userCriteria.add(Restrictions.eq("email", "admin@admin"));
		User user = (User) userCriteria.uniqueResult();
		if (user == null) {
			user = new User();
			user.setName("Administrador Padrão");
			user.setEmail("admin@admin");
			user.setPassword(CryptManager.passwordHash("admin"));
			user.setAccess(UserRoles.SYS_ADMIN.getAccessLevel());
			dao.persist(user);
		}
		
		Criteria imageMainPageCriteria = dao.newCriteria(ImageMainPage.class);
		imageMainPageCriteria.add(Restrictions.eq("id", (long) 1));
		imageMainPageCriteria.add(Restrictions.eq("imageName", "Logomarca - Con Animal"));
		ImageMainPage imageMainPage = (ImageMainPage) imageMainPageCriteria.uniqueResult();
		if (imageMainPage == null) {
			imageMainPage = new ImageMainPage();
			imageMainPage.setImageName("Logomarca - Con Animal");
			imageMainPage.setImageContentType("image/png");
			imageMainPage.setImagePath(null);
			imageMainPage.setHidden(true);
			dao.persist(imageMainPage);
		}
		
		Criteria contactCriteria = dao.newCriteria(Contact.class);
		contactCriteria.add(Restrictions.eq("type", "Email"));
		Contact emailContact = (Contact) contactCriteria.uniqueResult();
		if (emailContact == null) {
			emailContact = new Contact();
			emailContact.setUrl("conanimal@gmail.com");
			emailContact.setType("Email");
			dao.persist(emailContact);
		}
		
		contactCriteria = dao.newCriteria(Contact.class);
		contactCriteria.add(Restrictions.eq("type", "Facebook"));
		Contact facebookContact = (Contact) contactCriteria.uniqueResult();
		if (facebookContact == null) {
			facebookContact = new Contact();
			facebookContact.setUrl("www.facebook.com/ongconanimal");
			facebookContact.setType("Facebook");
			dao.persist(facebookContact);
		}
		
		contactCriteria = dao.newCriteria(Contact.class);
		contactCriteria.add(Restrictions.eq("type", "Slogan"));
		Contact sloganContact = (Contact) contactCriteria.uniqueResult();
		if (sloganContact == null) {
			sloganContact = new Contact();
			sloganContact.setUrl("Porque o seu melhor amigo merece muito carinho!");
			sloganContact.setType("Slogan");
			dao.persist(sloganContact);
		}
		
		LOG.info("Overwriting SSL context to ignore invalid certificates...");
		try {
			SSLContext ctx = SSLContext.getInstance("TLS");
			ctx.init(new KeyManager[0], new TrustManager[] { new DefaultTrustManager() }, new SecureRandom());
			SSLContext.setDefault(ctx);
		} catch (GeneralSecurityException ex) {
			System.out.println("N�o consegui sobrescrever o SSLContext.");
			ex.printStackTrace();
		}

		LOG.info("Application setup completed.");
		mngr.closeSession();
	}

	public static class DefaultTrustManager implements X509TrustManager {

		@Override
		public void checkClientTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
		}

		@Override
		public void checkServerTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
		}

		@Override
		public X509Certificate[] getAcceptedIssuers() {
			return null;
		}
	}
}
