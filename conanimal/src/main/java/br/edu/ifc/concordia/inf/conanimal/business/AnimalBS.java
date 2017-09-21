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
	
	public Animal registerAnimal(User user, String title, String description, String mainImage, String mainImageContentType) {
		Animal animal = new Animal();
		animal.setUser(user);
		animal.setTitle(title);
		animal.setDescription(description);
		animal.setMain_image(mainImage);
		animal.setMainImageContentType(mainImageContentType);
		Date date = new Date();
		SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		animal.setRegister_date(date_format.format(date));
		this.dao.persist(animal);
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
