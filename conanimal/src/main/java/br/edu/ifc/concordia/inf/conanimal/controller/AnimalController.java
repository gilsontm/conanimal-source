package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.util.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.view.Results;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.AnimalBS;
import br.edu.ifc.concordia.inf.conanimal.business.UserBS;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class AnimalController extends AbstractController {
	
	@Inject private AnimalBS bs;
	@Inject private UserBS user_bs;
	@Inject private HttpServletResponse response;
	
	@Post(value="/registerAnimal")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerAnimal(String title, String description, UploadedFile image1) throws IOException {
		String image1FileName = "animal-id-1"+image1.getFileName();
		File imagem1File = new File(SystemConfigs.getConfig("sys.imagedir"), image1FileName);
		FileOutputStream out = new FileOutputStream(imagem1File, false);
		IOUtils.copy(image1.getFile(), out);
		out.close();
		
		if (!GeneralUtils.isEmpty(title) && !GeneralUtils.isEmpty(description))  {
			Animal animal = this.bs.registerAnimal(this.userSession.getUser(), title, description, imagem1File.getAbsolutePath(), image1.getContentType());
			if (animal == null) {
				this.result.redirectTo(UserController.class).adminPanel(1, "danger", "Houve um erro durante o registro. Tente novamente.");
			} else {
				this.result.redirectTo(UserController.class).adminPanel(1, "success", "Animal cadastrado com sucesso.");
			}
		} else {
			this.result.redirectTo(UserController.class).adminPanel(1, "danger", "Alguns campos não foram preenchidos corretamente.");
		}
	}
	
	@Get(value="/animal/{id}/image")
	@NoCache
	public void getAnimalImage(Long id) {
		try {
			Animal animal = this.bs.exists(id, Animal.class);
			if (animal == null) {
				this.result.notFound();
			} else {
				File file = new File(animal.getMain_image());
				FileInputStream in = new FileInputStream(file);
				this.response.setContentType(animal.getMainImageContentType());
				IOUtils.copy(in, this.response.getOutputStream());
				this.response.getOutputStream().close();
				in.close();
				this.result.nothing();
			}
		} catch (Throwable ex) {
			LOGGER.error(ex);
			this.result.use(Results.status()).badRequest(ex.getMessage());
		}
	}
	
	@Get(value="/viewAnimal{id}")
	@NoCache
	public void viewAnimal(Long id, String status, String message) {
		if (id == null) {
			this.result.notFound();
		} else {
			Animal current_animal = this.bs.exists(id, Animal.class);
			if (current_animal == null) {
				this.result.notFound();
			} else {
				this.result.include("currentAnimal", current_animal);
				this.result.include("currentAnimal_user", current_animal.getUser());
				this.result.include("user", this.userSession.getUser());
				this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
								
				if (status != null && !status.isEmpty()) {
					this.result.include("status", status);
				}
				if (message != null && !message.isEmpty()) {
					this.result.include("message", message);
				}
			}
		}
	}
	
	@Post(value="/viewAnimal{id}")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateAnimal(Long id, String title, String description, Boolean adopted, Boolean hidden) {
		if (id == null) {
			this.result.notFound();
		} else {
			Animal animal = this.bs.exists(id, Animal.class);
			if (animal == null) {
				this.result.notFound();
			} else {
				Animal updated_animal = this.bs.updateAnimal(animal, title, description, adopted, hidden);
				if (updated_animal == null) {
					this.result.forwardTo(this).viewAnimal(animal.getId(), "danger", "Houve um erro e as informações não foram atualizadas. Tente novamente.");
				} else {
					this.result.forwardTo(this).viewAnimal(updated_animal.getId(), "success", "As informações foram atualizadas com sucesso.");
				}
			}
		}
		
	}
}
