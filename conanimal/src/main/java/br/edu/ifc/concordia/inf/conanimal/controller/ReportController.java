package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.business.ReportBS;
import br.edu.ifc.concordia.inf.conanimal.business.ReportFileBS;
import br.edu.ifc.concordia.inf.conanimal.model.Report;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class ReportController extends AbstractController {

	@Inject ReportBS bs;
	@Inject ReportFileBS report_file_bs;
	@Inject PartnerBS partner_bs;
	
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
		
		this.result.include("partners", this.partner_bs.listNotHiddenPartners());
	}
	
	
	@Post(value="/report/register")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerReport(String title, UploadedFile... files) throws IOException {
		if (GeneralUtils.isEmpty(title) || files == null || !(files.length > 0) ) {
			//Alguns campos não foram preenchidos. Tente novamente.
			this.result.redirectTo(UserController.class).adminPanel(3, "danger", Integer.toString(files.length));
		} else {
			Report report = this.bs.registerReport(title, this.userSession.getUser());
			if (report == null) {
				this.result.redirectTo(UserController.class).adminPanel(3, "danger", "Houve um erro durante o cadastro. Tente novamente.");
			} else {
				int fileCount = 1;
				for (UploadedFile file : files) {
					if (file != null) {
						String fileName = "report-" + report.getId() + "-pdf" + fileCount + ".pdf";
						File pdfFile = new File(SystemConfigs.getConfig("sys.imagedir"), fileName);
						FileOutputStream out = new FileOutputStream(pdfFile, false);
						IOUtils.copy(file.getFile(), out);
						out.close();
						this.report_file_bs.registerReportFile(report, pdfFile.getAbsolutePath());
					}
				}
				
				this.result.redirectTo(UserController.class).adminPanel(3, "success", "Prestação de contas cadastrada com sucesso.");
			}
		}
	}
}
