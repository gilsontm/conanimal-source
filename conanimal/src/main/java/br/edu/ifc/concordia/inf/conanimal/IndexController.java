package br.edu.ifc.concordia.inf.conanimal;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.controller.UserController;

@Controller
public class IndexController extends AbstractController {
	
	@Path(value="/", priority=Path.HIGHEST)
	@NoCache
	public void index() {
		if (!this.userSession.isLogged()){
			this.result.redirectTo(UserController.class).login();
		}
	}
	
}
