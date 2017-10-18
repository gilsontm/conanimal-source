package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.util.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.view.Results;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.ReportBS;
import br.edu.ifc.concordia.inf.conanimal.business.ReportFileBS;
import br.edu.ifc.concordia.inf.conanimal.model.Report;
import br.edu.ifc.concordia.inf.conanimal.model.ReportFile;

@Controller
public class ReportFileController extends AbstractController {

	@Inject ReportFileBS bs;
	@Inject ReportBS report_bs;
	
	@Get(value="/report/{id}/viewFile/{number}")
	@NoCache
	public void viewReportFile(Long id, Integer number) {
		if ((0 < number) && (number < 10)) { 
			try {
				Report report = this.report_bs.exists(id, Report.class);
				if (report == null) {
					this.result.notFound();
				} else {
					List<ReportFile> report_files_list = this.bs.listFilesFromReport(report);
					if(report_files_list.size() >= number) {
						File file = new File(report_files_list.get(number - 1).getFilePath());
						FileInputStream in = new FileInputStream(file);
						this.response.setContentType("application/pdf");
						this.response.addHeader("Content-Disposition", "inline");
						IOUtils.copy(in, this.response.getOutputStream());
						this.response.getOutputStream().close();
						in.close();
						this.result.nothing();
					} else {
						this.result.notFound();
					}
				}
			} catch (Throwable ex) {
				LOGGER.error(ex);
				this.result.use(Results.status()).badRequest(ex.getMessage());
			}
		} else {
			this.result.notFound();
		}	
	}
}
