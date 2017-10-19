package br.edu.ifc.concordia.inf.conanimal;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.AnimalBS;
import br.edu.ifc.concordia.inf.conanimal.business.ContactBS;
import br.edu.ifc.concordia.inf.conanimal.business.ImageMainPageBS;
import br.edu.ifc.concordia.inf.conanimal.business.NewsBS;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.ImageMainPage;
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
	@Inject private ImageMainPageBS image_main_page_bs;
	@Inject private ContactBS contact_bs;
	
	@Path(value="/", priority=Path.HIGHEST)
	@NoCache
	public void index() {
		User user = this.user_session.getUser();
		if (user != null) {
			this.result.include("user", user);
			this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		}
		List<Animal> animals = this.animal_bs.listNotHiddenAnimals();
		Collections.reverse(animals);
		this.result.include("animals", animals);
		
		List<News> news = this.news_bs.listNotHiddenNews();
		Collections.reverse(news);
		this.result.include("news", news);
		
		List<Partner> partners = this.partner_bs.listNotHiddenPartners();
		this.result.include("partners", partners);
		
		List<ImageMainPage> imagesMainPage = this.image_main_page_bs.listNotHiddenImages();
		Collections.reverse(imagesMainPage);
		this.result.include("imagesMainPage", imagesMainPage);
		
		this.result.include("contacts", this.contact_bs.listLinkTypeContacts());
		this.result.include("sloganContact", this.contact_bs.getSloganContact());
		this.result.include("emailContact", this.contact_bs.getEmailContact());
		this.result.include("facebookContact", this.contact_bs.getFacebookContact());
		this.result.include("logoImage", this.image_main_page_bs.getLogoImage());
	}
	
}
