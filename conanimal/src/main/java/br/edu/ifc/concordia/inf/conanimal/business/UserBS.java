package br.edu.ifc.concordia.inf.conanimal.business;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.enterprise.context.RequestScoped;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.com.caelum.vraptor.boilerplate.util.CryptManager;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@RequestScoped
public class UserBS extends HibernateBusiness {
	
	public User login(String email, String password) {
		Criteria criteria = this.dao.newCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		criteria.add(Restrictions.eq("password", CryptManager.passwordHash(password)));
		return (User) criteria.uniqueResult();
	}
			
	public User register(String form_type, String user_name, String email, String password, 
			String profession, String rg, String cpf, String phone, String cell_phone, 
			String city, String uf, String neighborhood, String street, String complement, 
			Long payment, Boolean name_publishing, String company_name, String cnpj, 
			String representative_name) {
		
		Criteria criteria = this.dao.newCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		
		if (criteria.uniqueResult() == null) {
			User user = new User();
			user.setName(user_name);
			user.setPassword(CryptManager.passwordHash(password));
			user.setEmail(email);
			user.setRg(rg);
			user.setPhone(phone);
			user.setCellPhone(cell_phone);
			user.setCpf(cpf);
			user.setUf(uf);
			user.setCity(city);
			user.setNeighborhood(neighborhood);
			user.setStreet(street);
			user.setComplement(complement);
			user.setPayment(payment);
			user.setNamePublishing(name_publishing);
			Date date = new Date();
			SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			user.setRegisterDate(date_format.format(date));
			
			if (form_type.equals("private_person")) {
				user.setIsLegalPerson(false);
				user.setProfession(profession);
			} else {
				user.setIsLegalPerson(true);
				user.setRepresentativeName(representative_name);
				user.setCnpj(cnpj);
				user.setCompanyName(company_name);
			}
			
			this.dao.persist(user);
			return user;
		}
		return null;
	}
	
	public User update(User user, String user_name, String password, String profession,
			String rg, String cpf, String phone, String cell_phone, String city, String uf, 
			String neighborhood, String street, String complement, Long payment, Boolean name_publishing,
			String company_name, String cnpj, String representative_name) {
		
		user.setName(user_name);
		user.setRg(rg);
		user.setPhone(phone);
		user.setCellPhone(cell_phone);
		user.setCpf(cpf);
		user.setUf(uf);
		user.setCity(city);
		user.setNeighborhood(neighborhood);
		user.setStreet(street);
		user.setComplement(complement);
		user.setPayment(payment);
		user.setNamePublishing(name_publishing);
		
		if (user.getIsLegalPerson()) {
			user.setRepresentativeName(representative_name);
			user.setCnpj(cnpj);
			user.setCompanyName(company_name);
		} else {
			user.setProfession(profession);
		}
		this.dao.update(user);
		return user;
	}
	
	public User changePassword(User user, String password) {
		user.setPassword(CryptManager.passwordHash(password));
		this.dao.update(user);
		return user;
	}
	
	public User toggleUserActiveStatus(User user) {
		user.setActive(!user.getActive());
		this.dao.update(user);
		return user;
	}
	
	public List<User> listAllUsers(){
		Criteria criteria = this.dao.newCriteria(User.class);
		return this.dao.findByCriteria(criteria, User.class);
	}
	
	public User toggleUserAccessLevel(User user) {
		if (user.getAccess() == UserRoles.ADMIN.getAccessLevel()) {
			user.setAccess(UserRoles.NORMAL.getAccessLevel());
		} else {
			user.setAccess(UserRoles.ADMIN.getAccessLevel());
		}
		this.dao.update(user);
		return user;
	}
	
	public boolean recoverPassword(String email) throws MessagingException {
		Criteria criteria = this.dao.newCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		User user = (User) criteria.uniqueResult();
		if(user == null) {
			return false;
		}
		else {
			try {
				Properties properties = System.getProperties();
				properties.put("mail.smtp.starttls.enable", "true");
				properties.put("mail.smtp.host", "smtp.gmail.com");
				properties.put("mail.smtp.user", "sistemaconanimal@gmail.com");
				properties.put("mail.smtp.password", "sistemaCON");
				properties.put("mail.smtp.port", "587");
				properties.put("mail.smtp.auth", "true");
	
				// Get the default Session object.
				Session session = Session.getDefaultInstance(properties);
				
				// Create a default MimeMessage object.
				MimeMessage message = new MimeMessage(session);
	
				// Set From: header field of the header.
				message.setFrom(new InternetAddress("sistemaconanimal@gmail.com"));
	
				// Set To: header field of the header.
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	
				// Set Subject: header field
				message.setSubject("Con Animal - Nova Senha");
	
				Random random = new Random();
				String new_password = "";
				while (new_password.length() < 8) {
					new_password += random.nextInt(10);
				}
				
				
				user.setPassword(CryptManager.passwordHash(new_password));
				this.dao.update(user);
				message.setText("Sistema Con Animal - Sua nova senha: " + new_password);
	
				Transport t = session.getTransport("smtp");
				t.connect("smtp.gmail.com", "sistemaconanimal@gmail.com", "sistemaCON");
				t.sendMessage(message, message.getAllRecipients());
				t.close();
				return true;
			} 
			catch (AddressException mex) {
				mex.printStackTrace();
				return false;
			}
		}	
	}
}
