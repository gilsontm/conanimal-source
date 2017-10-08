package br.edu.ifc.concordia.inf.conanimal;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.AnimalBS;
import br.edu.ifc.concordia.inf.conanimal.business.NewsBS;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.News;
import br.edu.ifc.concordia.inf.conanimal.model.Partner;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class IndexController extends AbstractController {
	
	@Inject private UserSession user_session;
	@Inject private AnimalBS animal_bs;
	@Inject private NewsBS news_bs;
	@Inject private PartnerBS partner_bs;
	
	@Path(value="/", priority=Path.HIGHEST)
	@NoCache
	public void index() {
		User user = user_session.getUser();
		if (user != null) {
			this.result.include("user", user);
			this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		}
		List<Animal> animals = animal_bs.listAllAnimals();
		Collections.reverse(animals);
		this.result.include("animals", animals);
		
		List<News> news = news_bs.listNotHiddenNews();
		Collections.reverse(news);
		this.result.include("news", news);
		
		List<Partner> partners = partner_bs.listNotHiddenPartners();
		this.result.include("partners", partners);
	}
	
}
