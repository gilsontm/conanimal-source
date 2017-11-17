package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
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
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.ContactBS;
import br.edu.ifc.concordia.inf.conanimal.business.ImageMainPageBS;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.business.ReportBS;
import br.edu.ifc.concordia.inf.conanimal.business.ReportFileBS;
import br.edu.ifc.concordia.inf.conanimal.model.ImageMainPage;
import br.edu.ifc.concordia.inf.conanimal.model.Report;
import br.edu.ifc.concordia.inf.conanimal.model.ReportFile;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class ReportController extends AbstractController {

	@Inject private ReportBS bs;
	@Inject private ReportFileBS report_file_bs;
	@Inject private PartnerBS partner_bs;
	@Inject private ContactBS contact_bs;
	@Inject private ImageMainPageBS image_main_page_bs;
	
	@Get(value="/reports")
	@NoCache
	public void reportsPanel() {
		User user = this.userSession.getUser();
		if (user != null) {
			this.result.include("user", user);
			this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		}
		
		List<Report> reports = this.bs.listNotHiddenReports();
		Collections.reverse(reports);
		this.result.include("reports", reports);
		
		List<Integer> listReportFiles = new ArrayList<Integer>();
		for (Report report : reports) {
			listReportFiles.add(this.report_file_bs.listFilesFromReport(report).size());
		}
		this.result.include("listReportFiles", listReportFiles);
		
		List<ImageMainPage> imagesMainPage = this.image_main_page_bs.listNotHiddenImages();
		Collections.reverse(imagesMainPage);
		this.result.include("imagesMainPage", imagesMainPage);
		
		this.result.include("partners", this.partner_bs.listNotHiddenPartners());
		this.result.include("sloganContact", this.contact_bs.getSloganContact());
		this.result.include("emailContact", this.contact_bs.getEmailContact());
		this.result.include("facebookContact", this.contact_bs.getFacebookContact());
		this.result.include("logoImage", this.image_main_page_bs.getLogoImage());
	}
	
	
	@Post(value="/report/register")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerReport(String title, UploadedFile file1, UploadedFile file2, UploadedFile file3,
			UploadedFile file4, UploadedFile file5, UploadedFile file6, UploadedFile file7, UploadedFile file8, 
			UploadedFile file9, UploadedFile file10, UploadedFile file11, UploadedFile file12, UploadedFile file13,
			UploadedFile file14, UploadedFile file15, UploadedFile file16) throws IOException {
		if (GeneralUtils.isEmpty(title) || file1 == null) {
			this.result.redirectTo(UserController.class).adminPanel(3, "danger", "Alguns campos não foram preenchidos. Tente novamente.");
		} else {
			Report report = this.bs.registerReport(title, this.userSession.getUser());
			if (report == null) {
				this.result.redirectTo(UserController.class).adminPanel(3, "danger", "Houve um erro durante o cadastro. Tente novamente.");
			} else {
				List<UploadedFile> listFiles = new ArrayList<UploadedFile>();
				listFiles.add(file1);
				listFiles.add(file2);
				listFiles.add(file3);
				listFiles.add(file4);
				listFiles.add(file5);
				listFiles.add(file6);
				listFiles.add(file7);
				listFiles.add(file8);
				listFiles.add(file9);
				listFiles.add(file10);
				listFiles.add(file11);
				listFiles.add(file12);
				listFiles.add(file13);
				listFiles.add(file14);
				listFiles.add(file15);
				listFiles.add(file16);
				int fileCount = 1;
				for (UploadedFile file : listFiles) {
					if (file != null) {
						String fileName = "report-" + report.getId() + "-pdf-" + fileCount + ".pdf";
						File pdfFile = new File(SystemConfigs.getConfig("sys.filedir"), fileName);
						FileOutputStream out = new FileOutputStream(pdfFile, false);
						IOUtils.copy(file.getFile(), out);
						out.close();
						this.report_file_bs.registerReportFile(report, pdfFile.getAbsolutePath());
						fileCount++;
					}
				}
				this.result.redirectTo(UserController.class).adminPanel(3, "success", "Prestação de contas cadastrada com sucesso.");
			}
		}
	}
	
	@Get(value="/report/{id}/download")
	@NoCache
	public Download downloadReportFiles(Long id) {
		Report report = this.bs.exists(id, Report.class);
		if (report == null) {
			this.result.notFound();
			return null;
		} else if (report.getHidden()){
			this.result.notFound();
			return null;
		} else {
			List<ReportFile> filesList = this.report_file_bs.listFilesFromReport(report);
			if (filesList != null && filesList.size() > 0) {
				List<Path> pathList = new ArrayList<Path>();
				for (ReportFile file : filesList) {
					pathList.add(new File(file.getFilePath()).toPath());
				}
				return DownloadBuilder.of(pathList).withFileName("prestacao-de-contas-" + report.getId() +"-conanimal.zip").build();
			} else {
				this.result.redirectTo(this).reportsPanel();
				return null;
			}
		}
	}
}
