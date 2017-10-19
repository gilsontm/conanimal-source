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
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.model.Partner;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class PartnerController extends AbstractController {
	
	@Inject PartnerBS bs;
	
	@Post(value="/partner/register")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerPartner(String name, String url, UploadedFile image) throws IOException {
		if (GeneralUtils.isEmpty(name) || GeneralUtils.isEmpty(url) || image == null) {
			this.result.forwardTo(UserController.class).adminPanel(4, "danger", "Alguns campos não foram preenchidos. Tente novamente.");
		} else {
			Partner partner = bs.registerPartner(userSession.getUser(), name, url);
			if (partner == null) {
				this.result.forwardTo(UserController.class).adminPanel(4, "danger", "Houve um erro durante o cadastro. Tente novamente.");
			} else {
				String imageFileName = "partner-" + partner.getId() + "-image" + image.getFileName();
				File imageFile = new File(SystemConfigs.getConfig("sys.imagedir"), imageFileName);
				FileOutputStream out = new FileOutputStream(imageFile, false);
				IOUtils.copy(image.getFile(), out);
				out.close();
				this.bs.setPartnerImage(partner, imageFile.getAbsolutePath(), image.getContentType());
				this.result.forwardTo(UserController.class).adminPanel(4, "success", "Parceiro cadastrado com sucesso.");
			}
		}
	}
	
	@Post(value="/partner/{id}/hide")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void hidePartner(Long id) {
		Partner partner = this.bs.exists(id, Partner.class);
		if (partner == null) {
			this.result.notFound();
		} else {
			this.bs.hidePartner(partner);
			this.result.forwardTo(UserController.class).adminPanel(4, "success", "Parceiro desvinculado com sucesso.");
		}
	}
	
	@Get(value="/partner/{id}/image")
	@NoCache
	public void getPartnerImage(Long id) {
		try {
			Partner partner = this.bs.exists(id, Partner.class);
			if (partner == null) {
				this.result.notFound();
			} else {
				File file = new File(partner.getImagePath());
				FileInputStream in = new FileInputStream(file);
				this.response.setContentType(partner.getImageContentType());
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
}
