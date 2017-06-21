package br.edu.ifc.concordia.inf.conanimal.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.edu.ifc.concordia.inf.conanimal.IndexController;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.UserBS;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@Controller
public class UserController extends AbstractController {
	
	@Inject private UserBS bs;
	
	@Get(value="/login")
	@NoCache
	public void login(String errorMessage) {
		if (!GeneralUtils.isEmpty(errorMessage)){
			this.result.include("errorMessage", errorMessage);
		}
	}
	
	@Post(value="/login")
	@NoCache
	public void doLogin(String email, String password){ 
		/* Argumentos tem que ser o valor "name" do campo no input */
		User user = this.bs.login(email, password);
		
		if (user == null){
			this.result.redirectTo(this).login("Email e/ou senha inválido(s).");
		} else {
			this.userSession.login(user);
			this.result.redirectTo(IndexController.class).index();
		}
	}
	
}
