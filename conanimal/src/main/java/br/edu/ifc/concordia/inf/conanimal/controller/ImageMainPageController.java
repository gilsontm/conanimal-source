package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.inject.Inject;

import org.apache.poi.util.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.view.Results;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.ImageMainPageBS;
import br.edu.ifc.concordia.inf.conanimal.model.ImageMainPage;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class ImageMainPageController extends AbstractController {
	
	@Inject ImageMainPageBS bs;
	
	@Post(value="/imageMainPage/registerImage")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerImageMainPage(String name, UploadedFile image) throws IOException {
		if (GeneralUtils.isEmpty(name) || image == null) {
			this.result.redirectTo(UserController.class).adminPanel(6, "danger", "Alguns campos não foram preenchidos. Tente novamente.");  
		} else {
			ImageMainPage imageMainPage = this.bs.registerImageMainPage(userSession.getUser(), name);
			if (imageMainPage == null) {
				this.result.redirectTo(UserController.class).adminPanel(6, "danger", "Houve um erro durante o cadastro. Tente novamente.");
			} else {
				String imageName = "main-page-" + imageMainPage.getId() + "-image.pdf";
				File imageFile = new File(SystemConfigs.getConfig("sys.imagedir"), imageName);
				FileOutputStream out = new FileOutputStream(imageFile, false);
				IOUtils.copy(image.getFile(), out);
				out.close();
				this.bs.setImageInfo(imageMainPage, imageFile.getAbsolutePath(), image.getContentType());
				
				this.result.redirectTo(UserController.class).adminPanel(6, "success", "Imagem cadastrada com sucesso.");
			}
		}
	}
	
	@Get(value="/imageMainPage/{id}/view")
	@NoCache
	public void viewImageMainPage(Long id) {
		try {
			ImageMainPage image = this.bs.exists(id, ImageMainPage.class);
			if (image == null) {
				this.result.notFound();
			} else {
				File file = new File(image.getImagePath());
				FileInputStream in = new FileInputStream(file);
				this.response.setContentType(image.getImageContentType());
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
	
	@Post(value="/imageMainPage/{id}/hide")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void hideImageMainPage(Long id) {
		ImageMainPage image = this.bs.exists(id, ImageMainPage.class);
		if (image == null) {
			this.result.notFound();
		} else {
			this.bs.hideImage(image);
			this.result.forwardTo(UserController.class).adminPanel(6, "success", "Imagem desvinculada com sucesso.");
		}
	}
	
	@Post(value="/imageMainPage/updateLogo")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateLogo(UploadedFile image) throws IOException {
		if (image == null) {
			this.result.forwardTo(UserController.class).adminPanel(10, "danger", "O arquivo não foi selecionado. Tente novamente");
		} else {
			ImageMainPage imageMainPage = this.bs.exists((long) 1, ImageMainPage.class);
			if (imageMainPage == null) {
				this.result.redirectTo(UserController.class).adminPanel(10, "danger", "Houve um erro durante o cadastro. Tente novamente.");
			} else {
				String imageName = "logo-image.pdf";
				File imageFile = new File(SystemConfigs.getConfig("sys.imagedir"), imageName);
				FileOutputStream out = new FileOutputStream(imageFile, false);
				IOUtils.copy(image.getFile(), out);
				out.close();
				this.bs.setImageInfo(imageMainPage, imageFile.getAbsolutePath(), image.getContentType());
				this.result.redirectTo(UserController.class).adminPanel(10, "success", "Logomarca atualizada com sucesso.");
			}
		}
	}
}
