package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Partner;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class PartnerBS extends HibernateBusiness {
	
	public Partner registerPartner(User user, String name) {
		Partner partner = new Partner();
		partner.setUser(user);
		partner.setName(name);
		this.dao.persist(partner);
		return partner;
	}
	
	public void setPartnerImage(Partner partner, String imagePath, String imageContentType) {
		partner.setImagePath(imagePath);
		partner.setImageContentType(imageContentType);
		this.dao.update(partner);
	}
	
	public void hidePartner(Partner partner) {
		partner.setHidden(true);
		this.dao.update(partner);
	}
	
	public List<Partner> listAllPartners(){
		Criteria criteria = this.dao.newCriteria(Partner.class);
		return this.dao.findByCriteria(criteria, Partner.class);
	}
	
	public List<Partner> listNotHiddenPartners(){
		Criteria criteria = this.dao.newCriteria(Partner.class);
		criteria.add(Restrictions.or(Restrictions.eq("hidden", false), Restrictions.isNull("hidden")));
		return this.dao.findByCriteria(criteria, Partner.class);
	}
}
