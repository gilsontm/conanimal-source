package br.edu.ifc.concordia.inf.conanimal.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.Contact;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class ContactBS extends HibernateBusiness{
	
	public Contact registerContact(User user, String url, String type) {
		Contact contact = new Contact();
		contact.setUser(user);
		contact.setUrl(url);
		contact.setType(type);
		this.dao.persist(contact);
		return contact;
	}
	
	public void updateContact(Contact contact, String url) {
		contact.setUrl(url);
		this.dao.update(contact);
	}
	
	public Contact getSloganContact() {
		Criteria criteria = this.dao.newCriteria(Contact.class);
		criteria.add(Restrictions.eq("type", "Slogan"));
		return (Contact) criteria.uniqueResult();
	}
	
	public Contact getEmailContact() {
		Criteria criteria = this.dao.newCriteria(Contact.class);
		criteria.add(Restrictions.eq("type", "Email"));
		return (Contact) criteria.uniqueResult();
	}
	
	public Contact getFacebookContact() {
		Criteria criteria = this.dao.newCriteria(Contact.class);
		criteria.add(Restrictions.eq("type", "Facebook"));
		return (Contact) criteria.uniqueResult();
	}
	
	public List<Contact> listAllContacts(){
		Criteria criteria = this.dao.newCriteria(Contact.class);
		return this.dao.findByCriteria(criteria, Contact.class);
	}
	
	public List<Contact> listLinkTypeContacts(){
		Criteria criteria = this.dao.newCriteria(Contact.class);
		criteria.add(Restrictions.eq("type", "Link"));
		return this.dao.findByCriteria(criteria, Contact.class);
	}
}
