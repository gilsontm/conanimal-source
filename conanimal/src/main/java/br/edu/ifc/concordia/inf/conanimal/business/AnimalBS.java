package br.edu.ifc.concordia.inf.conanimal.business;

import javax.enterprise.context.RequestScoped;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;

@RequestScoped
public class AnimalBS extends HibernateBusiness {
	
	public Animal registerAnimal(Long user_id, String title, String description) {
		Animal animal = new Animal();
		animal.setUser_id(user_id);
		animal.setTitle(title);
		animal.setDescription(description);
		
		this.dao.persist(animal);
		return animal;
	}
	
	
}
