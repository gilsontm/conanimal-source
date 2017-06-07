package br.edu.ifc.concordia.inf.conanimal.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;

@Controller
public class UserController extends AbstractController {
	
	
	@Get(value="/login")
	@NoCache
	public void login() {
		
	}
	
}
