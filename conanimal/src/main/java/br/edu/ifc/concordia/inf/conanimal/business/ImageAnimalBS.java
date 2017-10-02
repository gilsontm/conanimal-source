package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.ImageAnimal;

@RequestScoped
public class ImageAnimalBS extends HibernateBusiness{
	
	public void registerImageAnimal(Animal animal, String imagePath, String imageContentType) {
		ImageAnimal imageAnimal = new ImageAnimal();
		imageAnimal.setAnimal(animal);
		imageAnimal.setImagePath(imagePath);
		imageAnimal.setImageContentType(imageContentType);
		this.dao.persist(imageAnimal);
	}
	
	public List<ImageAnimal> listImagesFromAnimal(Animal animal){
		Criteria criteria = this.dao.newCriteria(ImageAnimal.class);
		criteria.add(Restrictions.eq("animal", animal));
		return this.dao.findByCriteria(criteria, ImageAnimal.class);
	}
	
	public void detachImage(ImageAnimal image) {
		image.setAnimal(null);
		this.dao.update(image);
	}
	
}
