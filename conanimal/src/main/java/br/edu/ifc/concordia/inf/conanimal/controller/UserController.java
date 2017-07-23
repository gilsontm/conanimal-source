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
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

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
		if (email != null && password != null) {
			User user = this.bs.login(email, password);
			
			if (user == null){
				this.result.redirectTo(this).login("Email e/ou senha inválido(s).");
			} else if (user.getActive()){
				this.userSession.login(user);
				this.result.redirectTo(IndexController.class).index();
			} else {
				this.result.redirectTo(this).login("Essa conta foi desativada.");
			}
		} else {
			this.result.redirectTo(this).login("Email e/ou senha inválido(s).");
		}
		
	}
	
	@Get(value="/logout")
	@NoCache
	public void logout() {
		this.userSession.logout();
		this.result.redirectTo(IndexController.class).index();
	}
	
	@Get(value="/register")
	@NoCache
	public void register(String errorMessage) {
		if (!GeneralUtils.isEmpty(errorMessage)){
			this.result.include("errorMessage", errorMessage);
		}
	}
	
	@Post(value="/register")
	@NoCache
	public void register(String form_type, String name, String email, String password, 
			String confirm_password, String profession, String rg, String cpf, String phone, 
			String cell_phone, String city, String uf, String neighborhood, String street, 
			String complement, Long payment, Boolean name_publishing, String company_name, 
			String cnpj, String representative_name) {
		
		if ((email != null && !email.isEmpty()) && (password != null && !password.isEmpty())){
			if (password.equals(confirm_password)) {
				User user = this.bs.register(form_type, name, email, password, profession, rg, cpf,
						phone, cell_phone, city, uf, neighborhood, street, complement, payment, 
						name_publishing, company_name, cnpj, representative_name);
				if (user == null) {
					this.result.redirectTo(this).register("Esse email já está sendo utilizado.");
				} else {
					this.result.redirectTo(IndexController.class).index();
				}
			} else {
				this.result.redirectTo(this).register("Senha e confirmação de senha não batem. Tente novamente.");
			}			
		} else {
			this.result.redirectTo(this).register("Alguns campos não foram preenchidos corretamente.");
		}
	}
	
	@Get(value="/profile")
	@Permission
	@NoCache
	public void profile(int formNumber, String status, String message) {
		this.result.include("user", this.userSession.getUser());
		this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		this.result.include("formNumber", formNumber);
		this.result.include("status", status);
		this.result.include("message", message);
	}
	
	@Post(value="/profile")
	@Permission
	@NoCache
	public void updateProfile(String name, String password, String profession,
			String rg, String cpf, String phone, String cell_phone, String city, String uf, 
			String neighborhood, String street, String complement, Long payment, Boolean name_publishing,
			String company_name, String cnpj, String representative_name){
		if (password != null) {
			User user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (user != null) {
				User updated_user = this.bs.update(user, name, password, profession, rg, cpf, phone, cell_phone,
						city, uf, neighborhood, street, complement, payment, name_publishing, company_name,
						cnpj, representative_name);
				this.userSession.login(updated_user);
				this.result.redirectTo(this).profile(1, "success", "Suas informações foram atualizadas com sucesso.");
			} else {
				this.result.redirectTo(this).profile(1, "danger", "Senha incorreta. Tente novamente.");	
			}
		} else {
			this.result.redirectTo(this).profile(1, "danger", "Senha inválida. Tente novamente.");
		}
	}
	
	@Post(value="/changePassword")
	@Permission
	@NoCache
	public void changePassword(String password, String new_password, String confirm_new_password) {
		if (password != null) {
			User user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (user != null) {
				if (new_password != null && new_password.equals(confirm_new_password)) {
					User updated_user = this.bs.changePassword(user, new_password);
					this.userSession.login(updated_user);
					this.result.redirectTo(this).profile(2, "success", "Sua senha foi alterada com sucesso.");
				} else {
					this.result.redirectTo(this).profile(2, "danger", "Nova senha e sua confirmação não batem. Tente novamente.");
				}
			} else {
				this.result.redirectTo(this).profile(2, "danger", "Senha incorreta. Tente novamente.");
			}
		} else {
			this.result.redirectTo(this).profile(2, "danger", "Senha inválida. Tente novamente.");
		}
	}
	
	@Post(value="/deactivateAccount")
	@Permission
	@NoCache
	public void deactivate(String password) {
		if (password != null) {
			User user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (user != null) {
				this.bs.deactivate(user);
				this.userSession.logout();
				this.result.redirectTo(this).login("Sua conta foi desativada.");
			} else {
				this.result.redirectTo(this).profile(3, "danger", "Senha incorreta. Tente novamente.");
			}
		} else {
			this.result.redirectTo(this).profile(3, "danger", "Senha inválida. Tente novamente.");
		}
	}
}






















