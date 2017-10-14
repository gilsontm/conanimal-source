package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.LegislationFile;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class LegislationFileBS extends HibernateBusiness {
	
	public LegislationFile registerFile(User user, String name) {
		LegislationFile file = new LegislationFile();
		file.setUser(user);
		file.setFileName(name);
		this.dao.persist(file);
		return file;
	}
	
	public void setFilePath(LegislationFile file, String path) {
		file.setFilePath(path);
		this.dao.update(file);
	}
	
	public void hideFile(LegislationFile file) {
		file.setHidden(true);
		this.dao.update(file);
	}
	
	public List<LegislationFile> listAllFiles(){
		Criteria criteria = this.dao.newCriteria(LegislationFile.class);
		return this.dao.findByCriteria(criteria, LegislationFile.class);
	}
	
	public List<LegislationFile> listNotHiddenFiles(){
		Criteria criteria = this.dao.newCriteria(LegislationFile.class);
		criteria.add(Restrictions.or(Restrictions.eq("hidden", false), Restrictions.isNull("hidden")));
		return this.dao.findByCriteria(criteria, LegislationFile.class);
	}
}
