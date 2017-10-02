package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.ImageAnimal;
import br.edu.ifc.concordia.inf.conanimal.model.ImageNews;
import br.edu.ifc.concordia.inf.conanimal.model.News;

@RequestScoped
public class ImageNewsBS extends HibernateBusiness {
	
	public void registerImageNews(News news, String imagePath, String imageContentType) {
		ImageNews imageNews = new ImageNews();
		imageNews.setNews(news);
		imageNews.setImagePath(imagePath);
		imageNews.setImageContentType(imageContentType);
		this.dao.persist(imageNews);
	}
	
	public List<ImageNews> listImagesFromNews(News news){
		Criteria criteria = this.dao.newCriteria(ImageNews.class);
		criteria.add(Restrictions.eq("news", news));
		return this.dao.findByCriteria(criteria, ImageNews.class);
	}
	
	public void detachImage(ImageNews image) {
		image.setNews(null);
		this.dao.update(image);
	}
}
