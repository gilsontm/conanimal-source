package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.ImageMainPage;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class ImageMainPageBS extends HibernateBusiness {

	public ImageMainPage registerImageMainPage(User user, String name) {
		ImageMainPage imageMainPage = new ImageMainPage();
		imageMainPage.setUser(user);
		imageMainPage.setImageName(name);
		this.dao.persist(imageMainPage);
		return imageMainPage;
	}
	
	public void setImageInfo(ImageMainPage imageMainPage, String path, String contentType) {
		imageMainPage.setImagePath(path);
		imageMainPage.setImageContentType(contentType);
		this.dao.update(imageMainPage);
	}
	
	public List<ImageMainPage> listAllImages(){
		Criteria criteria = this.dao.newCriteria(ImageMainPage.class);
		return this.dao.findByCriteria(criteria, ImageMainPage.class);
	}
	
	public List<ImageMainPage> listNotHiddenImages(){
		Criteria criteria = this.dao.newCriteria(ImageMainPage.class);
		criteria.add(Restrictions.or(Restrictions.eq("hidden", false), Restrictions.isNull("hidden")));
		return this.dao.findByCriteria(criteria, ImageMainPage.class);
	}
	
	public void hideImage(ImageMainPage image) {
		image.setHidden(true);
		this.dao.update(image);
	}
	
	public ImageMainPage getLogoImage() {
		Criteria criteria = this.dao.newCriteria(ImageMainPage.class);
		criteria.add(Restrictions.eq("id", (long) 1));
		criteria.add(Restrictions.eq("imageName", "Logomarca - Con Animal"));
		criteria.add(Restrictions.eq("hidden", true));
		return (ImageMainPage) criteria.uniqueResult();
	}
}
