package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
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
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.business.StatuteFileBS;
import br.edu.ifc.concordia.inf.conanimal.model.LegislationFile;
import br.edu.ifc.concordia.inf.conanimal.model.StatuteFile;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class StatuteFileController extends AbstractController {
	
	@Inject StatuteFileBS bs;
	@Inject PartnerBS partner_bs;
	
	@Post(value="/registerStatuteFile")
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
				File pdfFile = new File(SystemConfigs.getConfig("sys.imagedir"), fileName);
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
		this.result.include("statuteFiles", this.bs.listNotHiddenFiles());
		this.result.include("partners", this.partner_bs.listNotHiddenPartners());
	}
	
	@Post(value="/hideStatute{id}")
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
	
	@Get(value="/downloadStatute")
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
}
