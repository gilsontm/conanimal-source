package br.edu.ifc.concordia.inf.conanimal.business;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.com.caelum.vraptor.boilerplate.util.CryptManager;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@RequestScoped
public class UserBS extends HibernateBusiness {
	
	public User login(String email, String password) {
		Criteria criteria = this.dao.newCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		criteria.add(Restrictions.eq("password", CryptManager.passwordHash(password)));
		return (User) criteria.uniqueResult();
	}
			
	public User register(String form_type, String name, String email, String password, 
			String profession, String rg, String cpf, String phone, String cell_phone, 
			String city, String uf, String neighborhood, String street, String complement, 
			Long payment, Boolean name_publishing, String company_name, String cnpj, 
			String representative_name) {
		
		Criteria criteria = this.dao.newCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		
		if (criteria.uniqueResult() == null) {
			User user = new User();
			user.setName(name);
			user.setPassword(CryptManager.passwordHash(password));
			user.setEmail(email);
			user.setRg(rg);
			user.setPhone(phone);
			user.setCell_phone(cell_phone);
			user.setCpf(cpf);
			user.setUf(uf);
			user.setCity(city);
			user.setNeighborhood(neighborhood);
			user.setStreet(street);
			user.setComplement(complement);
			user.setPayment(payment);
			user.setName_publishing(name_publishing);
			Date date = new Date();
			SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			user.setRegister_date(date_format.format(date));
			
			if (form_type.equals("private_person")) {
				user.setIs_legal_person(false);
				user.setProfession(profession);
			} else {
				user.setIs_legal_person(true);
				user.setRepresentative_name(representative_name);
				user.setCnpj(cnpj);
				user.setCompany_name(company_name);
			}
			
			this.dao.persist(user);
			return user;
		}
		return null;
	}
	
	public User update(User user, String name, String password, String profession,
			String rg, String cpf, String phone, String cell_phone, String city, String uf, 
			String neighborhood, String street, String complement, Long payment, Boolean name_publishing,
			String company_name, String cnpj, String representative_name) {
		
		user.setName(name);
		user.setRg(rg);
		user.setPhone(phone);
		user.setCell_phone(cell_phone);
		user.setCpf(cpf);
		user.setUf(uf);
		user.setCity(city);
		user.setNeighborhood(neighborhood);
		user.setStreet(street);
		user.setComplement(complement);
		user.setPayment(payment);
		user.setName_publishing(name_publishing);
		
		if (user.getIs_legal_person()) {
			user.setRepresentative_name(representative_name);
			user.setCnpj(cnpj);
			user.setCompany_name(company_name);
		} else {
			user.setProfession(profession);
		}
		this.dao.update(user);
		return user;
	}
	
	public User changePassword(User user, String password) {
		user.setPassword(CryptManager.passwordHash(password));
		this.dao.update(user);
		return user;
	}
	
	public User toggleUserActiveStatus(User user) {
		user.setActive(!user.getActive());
		this.dao.update(user);
		return user;
	}
	
	public List<User> listAllUsers(){
		Criteria criteria = this.dao.newCriteria(User.class);
		return this.dao.findByCriteria(criteria, User.class);
	}
	
	public User toggleUserAccessLevel(User user) {
		if (user.getAccess() == UserRoles.ADMIN.getAccessLevel()) {
			user.setAccess(UserRoles.NORMAL.getAccessLevel());
		} else {
			user.setAccess(UserRoles.ADMIN.getAccessLevel());
		}
		this.dao.update(user);
		return user;
	}
	
	
}
