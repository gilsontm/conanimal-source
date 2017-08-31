package br.edu.ifc.concordia.inf.conanimal.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.AnimalBS;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;

@Controller
public class AnimalController extends AbstractController {
	
	@Inject private AnimalBS bs;
	
	@Post(value="/registerAnimal")
	@NoCache
	public void registerAnimal(String title, String description) {
		if ((title != null && !title.isEmpty()) && (description != null && !description.isEmpty()))  {
			Animal animal = this.bs.registerAnimal(this.userSession.getUser().getId(), title, description);
			if (animal == null) {
				this.result.redirectTo(UserController.class).adminPanel(1, "danger", "Houve um erro durante o registro. Tente novamente.");
			} else {
				this.result.redirectTo(UserController.class).adminPanel(1, "success", "Animal cadastrado com sucesso.");
			}
		} else {
			this.result.redirectTo(UserController.class).adminPanel(1, "danger", "Alguns campos não foram preenchidos corretamente.");
		}
	}
}
