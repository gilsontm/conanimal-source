package br.edu.ifc.concordia.inf.conanimal.abstractions;

import javax.inject.Inject;

import br.edu.ifc.concordia.inf.conanimal.UserSession;

/**
 * @author Renato R. R. de Oliveira <renatorro@comp.ufla.br>
 *
 */
public abstract class AbstractController extends br.com.caelum.vraptor.boilerplate.AbstractController {

	/** Prefixo dos end points REST. */
	protected static final String BASEPATH = "/api";
	
	/** Objecto da sessão do usuário. Injetado automaticamente. */
	@Inject protected UserSession userSession;
}
