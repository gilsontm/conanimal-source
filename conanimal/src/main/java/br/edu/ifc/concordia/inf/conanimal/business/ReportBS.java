package br.edu.ifc.concordia.inf.conanimal.business;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Report;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class ReportBS extends HibernateBusiness {

	public Report registerReport(String title, User user) {
		Report report = new Report();
		report.setTitle(title);
		report.setUser(user);
		report.setHidden(false);
		Date date = new Date();
		SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		report.setRegisterDate(date_format.format(date));
		this.dao.persist(report);
		return report;
	}
	
	public List<Report> listAllReports() {
		Criteria criteria = this.dao.newCriteria(Report.class);
		return this.dao.findByCriteria(criteria, Report.class);
	}
	
	public List<Report> listNotHiddenReports() {
		Criteria criteria = this.dao.newCriteria(Report.class);
		criteria.add(Restrictions.or(Restrictions.eq("hidden", false), Restrictions.isNull("hidden")));
		return this.dao.findByCriteria(criteria, Report.class);
	}
}
