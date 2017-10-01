package br.edu.ifc.concordia.inf.conanimal.business;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class AnimalBS extends HibernateBusiness {
	
	public Animal registerAnimal(User user, String title, String description) {
		Animal animal = new Animal();
		animal.setUser(user);
		animal.setTitle(title);
		animal.setDescription(description);
		Date date = new Date();
		SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		animal.setRegisterDate(date_format.format(date));
		this.dao.persist(animal);
		return animal;
	}
	
	public Animal setAnimalImage(Animal animal, String mainImage, String mainImageContentType) {
		animal.setMainImage(mainImage);
		animal.setMainImageContentType(mainImageContentType);
		this.dao.update(animal);
		return animal;
	}
	
	public Animal updateAnimal(Animal animal, String title, String description, Boolean adopted, Boolean hidden) {
		animal.setTitle(title);
		animal.setDescription(description);
		animal.setAdopted(adopted);
		animal.setHidden(hidden);
		this.dao.update(animal);
		return animal;
	}
	public List<Animal> listAllAnimals(){
		Criteria criteria = this.dao.newCriteria(Animal.class);
		return this.dao.findByCriteria(criteria, Animal.class);
	}
	
	
	
}
