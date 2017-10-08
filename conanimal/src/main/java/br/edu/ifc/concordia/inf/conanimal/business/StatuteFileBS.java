package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.StatuteFile;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class StatuteFileBS extends HibernateBusiness {
	
	public StatuteFile registerFile(User user, String name) {
		StatuteFile file = new StatuteFile();
		file.setUser(user);
		file.setFileName(name);
		this.dao.persist(file);
		return file;
	}
	
	public void setFilePath(StatuteFile file, String path) {
		file.setFilePath(path);
		this.dao.update(file);
	}
	
	public void hideFile(StatuteFile file) {
		file.setHidden(true);
		this.dao.update(file);
	}
	
	public List<StatuteFile> listAllFiles(){
		Criteria criteria = this.dao.newCriteria(StatuteFile.class);
		return this.dao.findByCriteria(criteria, StatuteFile.class);
	}
	
	public List<StatuteFile> listNotHiddenFiles(){
		Criteria criteria = this.dao.newCriteria(StatuteFile.class);
		criteria.add(Restrictions.or(Restrictions.eq("hidden", false), Restrictions.isNull("hidden")));
		return this.dao.findByCriteria(criteria, StatuteFile.class);
	}
}
