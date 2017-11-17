package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.util.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.DownloadBuilder;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.view.Results;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.ContactBS;
import br.edu.ifc.concordia.inf.conanimal.business.ImageMainPageBS;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.business.StatuteFileBS;
import br.edu.ifc.concordia.inf.conanimal.model.ImageMainPage;
import br.edu.ifc.concordia.inf.conanimal.model.StatuteFile;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class StatuteFileController extends AbstractController {
	
	@Inject private StatuteFileBS bs;
	@Inject private PartnerBS partner_bs;
	@Inject private ContactBS contact_bs;
	@Inject private ImageMainPageBS image_main_page_bs;
	
	@Post(value="/statute/registerFile")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerStatuteFile(String name, UploadedFile file) throws IOException {
		if (GeneralUtils.isEmpty(name) || file == null) {
			this.result.redirectTo(UserController.class).adminPanel(7, "danger", "Alguns campos não foram preenchidos. Tente novamente.");  
		} else {
			StatuteFile statuteFile = this.bs.registerFile(userSession.getUser(), name);
			if (statuteFile == null) {
				this.result.redirectTo(UserController.class).adminPanel(7, "danger", "Houve um erro durante o cadastro. Tente novamente.");
			} else {
				String fileName = "statute-" + statuteFile.getId() + "-pdf.pdf";
				File pdfFile = new File(SystemConfigs.getConfig("sys.filedir"), fileName);
				FileOutputStream out = new FileOutputStream(pdfFile, false);
				IOUtils.copy(file.getFile(), out);
				out.close();
				this.bs.setFilePath(statuteFile, pdfFile.getAbsolutePath());
				
				this.result.redirectTo(UserController.class).adminPanel(7, "success", "Arquivo cadastrado com sucesso.");
			}
		}
	}
	
	@Get(value="/statute")
	@NoCache
	public void statute() {
		User user = this.userSession.getUser();
		if (user != null) {
			this.result.include("user", user);
			this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		}
		
		List<ImageMainPage> imagesMainPage = this.image_main_page_bs.listNotHiddenImages();
		Collections.reverse(imagesMainPage);
		this.result.include("imagesMainPage", imagesMainPage);
		
		this.result.include("statuteFiles", this.bs.listNotHiddenFiles());
		this.result.include("partners", this.partner_bs.listNotHiddenPartners());
		this.result.include("sloganContact", this.contact_bs.getSloganContact());
		this.result.include("emailContact", this.contact_bs.getEmailContact());
		this.result.include("facebookContact", this.contact_bs.getFacebookContact());
		this.result.include("logoImage", this.image_main_page_bs.getLogoImage());
	}
	
	@Post(value="/statute/{id}/hide")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void hideFile(Long id) {
		StatuteFile file = this.bs.exists(id, StatuteFile.class);
		if (file == null) {
			this.result.notFound();
		} else {
			this.bs.hideFile(file);
			this.result.forwardTo(UserController.class).adminPanel(7, "success", "Arquivo desvinculado com sucesso.");
		}
	}
	
	@Get(value="/statute/download")
	@NoCache
	public Download download() {
		List<StatuteFile> filesList = this.bs.listNotHiddenFiles();
		if (filesList != null && filesList.size() > 0) {
			List<Path> pathList = new ArrayList<Path>();
			for (StatuteFile file : filesList) {
				pathList.add(new File(file.getFilePath()).toPath());
			}
			return DownloadBuilder.of(pathList).withFileName("estatuto-conanimal.zip").build();
		} else {
			this.result.redirectTo(this).statute();
			return null;
		}
	}
	
	@Get(value="/statute/{id}/view")
	@NoCache
	public void viewFiles(Long id) {
		try {
			StatuteFile statuteFile = this.bs.exists(id, StatuteFile.class);
			if (statuteFile == null) {
				this.result.notFound();
			} else {
				File file = new File(statuteFile.getFilePath());
				FileInputStream in = new FileInputStream(file);
				this.response.setContentType("application/pdf");
				this.response.addHeader("Content-Disposition", "inline");
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
