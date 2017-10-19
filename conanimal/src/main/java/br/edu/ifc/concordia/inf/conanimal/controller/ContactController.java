package br.edu.ifc.concordia.inf.conanimal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.ContactBS;
import br.edu.ifc.concordia.inf.conanimal.model.Contact;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class ContactController extends AbstractController {
	
	@Inject ContactBS bs;
	
	@Post(value="/contact/update")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateContacts(String email, String facebook, String link1,
			String link2, String link3, String link4, String link5) {
		if (GeneralUtils.isEmpty(email) || GeneralUtils.isEmpty(facebook)) {
			this.result.redirectTo(UserController.class).adminPanel(5, "danger", "Campos obrigatórios não foram preenchidos. Tente novamente.");
		} else {
			this.bs.updateContact(this.bs.getEmailContact(), email);
			this.bs.updateContact(this.bs.getFacebookContact(), facebook);
			
			List<String> listLinks = new ArrayList<String>();
			listLinks.add(link1);
			listLinks.add(link2);
			listLinks.add(link3);
			listLinks.add(link4);
			listLinks.add(link5);
			
			for (int i = 4; i <= 8; ++i) {
				Contact contact = this.bs.exists((long) i, Contact.class);
				if (contact == null) {
					this.bs.registerContact(this.userSession.getUser(), listLinks.get(i - 4), "Link");
				} else {
					this.bs.updateContact(contact, listLinks.get(i - 4));
				}
			}
			this.result.redirectTo(UserController.class).adminPanel(5, "success", "Contatos úteis atualizados com sucesso.");
		}
	}
	
	@Post(value="/contact/slogan/update")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateSlogan(String slogan) {
		if (GeneralUtils.isEmpty(slogan)) {
			this.result.redirectTo(UserController.class).adminPanel(9, "danger", "O campo é de preenchimento obrigatório.");
		} else {
			this.bs.updateContact(this.bs.getSloganContact(), slogan);
			this.result.redirectTo(UserController.class).adminPanel(9, "success", "Slogan atualizado com sucesso.");
		}
	}
}
