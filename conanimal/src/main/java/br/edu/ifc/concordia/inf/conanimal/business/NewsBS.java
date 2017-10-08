package br.edu.ifc.concordia.inf.conanimal.business;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.conanimal.model.News;
import br.edu.ifc.concordia.inf.conanimal.model.User;

@RequestScoped
public class NewsBS extends HibernateBusiness {
	
	public News registerNews(User user, String title, String description) {
		News news = new News();
		news.setUser(user);
		news.setTitle(title);
		news.setDescription(description);
		news.setHidden(false);
		Date date = new Date();
		SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		news.setRegisterDate(date_format.format(date));
		this.dao.persist(news);
		return news;
	}
	
	public News updateNews(News news, String title, String description, Boolean hidden) {
		news.setTitle(title);
		news.setDescription(description);
		news.setHidden(hidden);
		this.dao.update(news);
		return news;
	}
	
	public List<News> listAllNews(){
		Criteria criteria = this.dao.newCriteria(News.class);
		return this.dao.findByCriteria(criteria, News.class);
	}
	
	public List<News> listNotHiddenNews() {
		Criteria criteria = this.dao.newCriteria(News.class);
		criteria.add(Restrictions.or(Restrictions.eq("hidden", false), Restrictions.isNull("hidden")));
		return this.dao.findByCriteria(criteria, News.class);
	}
}
