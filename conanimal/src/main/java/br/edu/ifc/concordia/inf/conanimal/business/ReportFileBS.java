package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Report;
import br.edu.ifc.concordia.inf.conanimal.model.ReportFile;

@RequestScoped
public class ReportFileBS extends HibernateBusiness {

	public void registerReportFile(Report report, String filePath) {
		ReportFile reportFile = new ReportFile();
		reportFile.setReport(report);
		reportFile.setFilePath(filePath);
		this.dao.persist(reportFile);
	}
	
	public List<ReportFile> listFilesFromReport(Report report) {
		Criteria criteria = this.dao.newCriteria(ReportFile.class);
		criteria.add(Restrictions.eq("report", report));
		return this.dao.findByCriteria(criteria, ReportFile.class);
	}
}
