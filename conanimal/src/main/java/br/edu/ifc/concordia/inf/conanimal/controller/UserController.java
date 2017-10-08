package br.edu.ifc.concordia.inf.conanimal.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.edu.ifc.concordia.inf.conanimal.IndexController;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.AnimalBS;
import br.edu.ifc.concordia.inf.conanimal.business.LegislationFileBS;
import br.edu.ifc.concordia.inf.conanimal.business.NewsBS;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.business.StatuteFileBS;
import br.edu.ifc.concordia.inf.conanimal.business.UserBS;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.LegislationFile;
import br.edu.ifc.concordia.inf.conanimal.model.News;
import br.edu.ifc.concordia.inf.conanimal.model.Partner;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class UserController extends AbstractController {
	
	@Inject private UserBS bs;
	@Inject private AnimalBS animal_bs;
	@Inject private NewsBS news_bs;
	@Inject private PartnerBS partner_bs;
	@Inject private LegislationFileBS legislation_bs;
	@Inject private StatuteFileBS statute_bs;
	
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
	public void register(String form_type, String user_name, String email, String password, 
			String confirm_password, String profession, String rg, String cpf, String phone, 
			String cell_phone, String city, String uf, String neighborhood, String street, 
			String complement, Long payment, Boolean name_publishing, String company_name, 
			String cnpj, String representative_name) {
		
		if ((email != null && !email.isEmpty()) && (password != null && !password.isEmpty())){
			if (password.equals(confirm_password)) {
				User user = this.bs.register(form_type, user_name, email, password, profession, rg, cpf,
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
	public void profile(Integer formNumber, String status, String message) {
		this.result.include("user", this.userSession.getUser());
		this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		this.result.include("systemAdminAccessLevel", UserRoles.SYS_ADMIN.getAccessLevel());
		this.result.include("formNumber", formNumber);
		this.result.include("status", status);
		this.result.include("message", message);
	}
	
	@Post(value="/profile")
	@Permission
	@NoCache
	public void updateProfile(String user_name, String password, String profession,
			String rg, String cpf, String phone, String cell_phone, String city, String uf, 
			String neighborhood, String street, String complement, Long payment, Boolean name_publishing,
			String company_name, String cnpj, String representative_name){
		if (password != null) {
			User logged_user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (logged_user != null) {
				User updated_user = this.bs.update(logged_user, user_name, password, profession, rg, cpf, phone, cell_phone,
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
			User logged_user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (logged_user != null) {
				if (new_password != null && new_password.equals(confirm_new_password)) {
					User updated_user = this.bs.changePassword(logged_user, new_password);
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
	public void deactivateOwnAccount(String password) {
		if (password != null) {
			User logged_user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (logged_user == null) {
				this.result.redirectTo(this).profile(3, "danger", "Senha incorreta. Tente novamente.");
			} else if (logged_user.getAccess() == UserRoles.SYS_ADMIN.getAccessLevel()) {
				this.result.redirectTo(this).profile(3, "danger", "Você não tem permissão para alterar o status deste usuário.");
			} else {
				this.bs.toggleUserActiveStatus(logged_user);
				this.userSession.logout();
				this.result.redirectTo(this).login("Sua conta foi desativada.");
			}
		} else {
			this.result.redirectTo(this).profile(3, "danger", "Senha inválida. Tente novamente.");
		}
	}
	
	@Get(value="/adminPanel")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void adminPanel(Integer formNumber, String status, String message) {
		this.result.include("users", this.bs.listAllUsers());
		this.result.include("animals", this.animal_bs.listAllAnimals());
		this.result.include("news", this.news_bs.listAllNews());
		this.result.include("partners", this.partner_bs.listNotHiddenPartners());
		this.result.include("legislationFiles", this.legislation_bs.listNotHiddenFiles());
		this.result.include("statuteFiles", this.statute_bs.listNotHiddenFiles());
		this.result.include("user", this.userSession.getUser());
		this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		this.result.include("formNumber", formNumber);
		this.result.include("status", status);
		this.result.include("message", message);
	}
	
	@Get(value="/viewUser{id}")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void viewUserProfile(Long id, String status, String message) {
		if (id == null) {
			this.result.notFound();
		} else {
			User current_user = this.bs.exists(id, User.class);
			if (current_user == null) {
				this.result.notFound();
			} else {
				this.result.include("currentUser", current_user);
				this.result.include("user", this.userSession.getUser());
				this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
				this.result.include("systemAdminAccessLevel", UserRoles.SYS_ADMIN.getAccessLevel());
				if (!GeneralUtils.isEmpty(status)) {
					this.result.include("status", status);
				}
				if (!GeneralUtils.isEmpty(message)) {
					this.result.include("message", message);
				}
			}
		}
	}
	
	@Post(value="/toggleUserAccess{id}")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void toggleUserAccess(Long id, String password) {
		if (password != null) {
			User logged_user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (logged_user == null) {
				this.result.redirectTo(this).viewUserProfile(id, "danger", "Senha incorreta. Tente novamente.");
			} else {
				if (id == null) {
					this.result.notFound();
				} else {
					User user = this.bs.exists(id, User.class);
					if (user == null) {
						this.result.notFound();
					} else if (user.getAccess() == UserRoles.SYS_ADMIN.getAccessLevel()) {
						this.result.redirectTo(this).viewUserProfile(id, "danger", "Você não tem permissão para alterar o nível de acesso deste usuário.");
					} else {
						this.bs.toggleUserAccessLevel(user);
						this.result.redirectTo(this).viewUserProfile(id, "success", "Nível de acesso modificado com sucesso.");
					}
				}
			}
		} else {
			this.result.redirectTo(this).viewUserProfile(id, "danger", "Senha inválida. Tente novamente");
		}
	}
	
	@Post(value="/toggleUserStatus{id}")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void toggleUserStatus(Long id, String password) {
		if (password != null) {
			User logged_user = this.bs.login(this.userSession.getUser().getEmail(), password);
			if (logged_user == null) {
				this.result.redirectTo(this).viewUserProfile(id, "danger", "Senha incorreta. Tente novamente.");
			} else {
				if (id == null) {
					this.result.notFound();
				} else {
					User user = this.bs.exists(id, User.class);
					if (user == null) {
						this.result.notFound();
					} else if (user.getAccess() == UserRoles.SYS_ADMIN.getAccessLevel()) {
						this.result.redirectTo(this).viewUserProfile(id, "danger", "Você não tem permissão para alterar o status deste usuário.");
					} else {
						this.bs.toggleUserActiveStatus(user);
						this.result.redirectTo(this).viewUserProfile(id, "success", "O status deste usuário foi alterado.");
					}
				}
			}
		} else {
			this.result.redirectTo(this).viewUserProfile(id, "danger", "Senha inválida. Tente novamente");
		}
	}
	
}






















