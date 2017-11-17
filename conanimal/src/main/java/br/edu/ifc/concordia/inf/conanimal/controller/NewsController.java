package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import br.edu.ifc.concordia.inf.conanimal.business.ContactBS;
import br.edu.ifc.concordia.inf.conanimal.business.ImageMainPageBS;
import br.edu.ifc.concordia.inf.conanimal.business.ImageNewsBS;
import br.edu.ifc.concordia.inf.conanimal.business.NewsBS;
import br.edu.ifc.concordia.inf.conanimal.business.PartnerBS;
import br.edu.ifc.concordia.inf.conanimal.model.ImageMainPage;
import br.edu.ifc.concordia.inf.conanimal.model.ImageNews;
import br.edu.ifc.concordia.inf.conanimal.model.News;
import br.edu.ifc.concordia.inf.conanimal.model.User;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class NewsController extends AbstractController {
	
	@Inject private NewsBS bs;
	@Inject private ImageNewsBS image_news_bs;
	@Inject private PartnerBS partner_bs;
	@Inject private ContactBS contact_bs;
	@Inject private ImageMainPageBS image_main_page_bs;
	
	@Get(value="/news")
	@NoCache
	public void newsPanel() {
		User user = this.userSession.getUser();
		if (user != null) {
			this.result.include("user", user);
			this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
		}
		List<News> news = this.bs.listNotHiddenNews();
		Collections.reverse(news);
		this.result.include("news", news);
		
		List<ImageMainPage> imagesMainPage = this.image_main_page_bs.listNotHiddenImages();
		Collections.reverse(imagesMainPage);
		this.result.include("imagesMainPage", imagesMainPage);
		
		this.result.include("partners", this.partner_bs.listNotHiddenPartners());
		this.result.include("sloganContact", this.contact_bs.getSloganContact());
		this.result.include("emailContact", this.contact_bs.getEmailContact());
		this.result.include("facebookContact", this.contact_bs.getFacebookContact());
		this.result.include("logoImage", this.image_main_page_bs.getLogoImage());
	}
	
	@Post(value="/news/register")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerNews(String title, String description, UploadedFile image1,
			UploadedFile image2, UploadedFile image3) throws IOException {
		if (!GeneralUtils.isEmpty(title) && !GeneralUtils.isEmpty(description)) {
			if (title.length() > 50) {
				this.result.redirectTo(UserController.class).adminPanel(2, "danger", "O título não pode exceder 50 caracteres.");
			} else if (description.length() > 1000) {
				this.result.redirectTo(UserController.class).adminPanel(2, "danger", "A descrição não pode exceder 1000 caracteres.");
			}
			News news = this.bs.registerNews(this.userSession.getUser(), title, description);
			if (news == null) {
				this.result.redirectTo(UserController.class).adminPanel(2, "danger", "Houve um erro durante o registro. Tente novamente.");
			} else {
				if (image1 != null) {
					String image1FileName = "news-" + news.getId() + "-image1" + image1.getFileName();
					File image1File = new File(SystemConfigs.getConfig("sys.imagedir"), image1FileName);
					FileOutputStream out1 = new FileOutputStream(image1File, false);
					IOUtils.copy(image1.getFile(), out1);
					out1.close();
					this.image_news_bs.registerImageNews(news, image1File.getAbsolutePath(), image1.getContentType());
				}
				if (image2 != null) {
					String image2FileName = "news-" + news.getId() + "-image2" + image2.getFileName();
					File image2File = new File(SystemConfigs.getConfig("sys.imagedir"), image2FileName);
					FileOutputStream out2 = new FileOutputStream(image2File, false);
					IOUtils.copy(image2.getFile(), out2);
					out2.close();
					this.image_news_bs.registerImageNews(news, image2File.getAbsolutePath(), image2.getContentType());
				}
				if (image3 != null) {
					String image3FileName = "news-" + news.getId() + "-image3" + image3.getFileName();
					File image3File = new File(SystemConfigs.getConfig("sys.imagedir"), image3FileName);
					FileOutputStream out3 = new FileOutputStream(image3File, false);
					IOUtils.copy(image3.getFile(), out3);
					out3.close();
					this.image_news_bs.registerImageNews(news, image3File.getAbsolutePath(), image3.getContentType());
				}
				this.result.redirectTo(UserController.class).adminPanel(2, "success", "Notícia cadastrada com sucesso.");
			}
		} else {
			this.result.redirectTo(UserController.class).adminPanel(2, "danger", "Alguns campos não foram preenchidos. Tente novamente.");
		}
	}
	
	@Get(value="/news/{id}/view")
	@NoCache
	public void viewNews(Long id, Integer formNumber, String status, String message) {
		if (id == null) {
			this.result.notFound();
		} else {
			News current_news = this.bs.exists(id, News.class);
			if (current_news == null) {
				this.result.notFound();
			} else {
				this.result.include("currentNews", current_news);
				this.result.include("user", this.userSession.getUser());
				this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
				this.result.include("numberImages", this.image_news_bs.listImagesFromNews(current_news).size());
				if (formNumber != null) {
					this.result.include("formNumber", formNumber);
				}
				if (status != null && !status.isEmpty()) {
					this.result.include("status", status);
				}
				if (message != null && !message.isEmpty()) {
					this.result.include("message", message);
				}
			}
		}
	}
	
	@Post(value="/news/{id}/view")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateNews(Long id, String title, String description, Boolean hidden) {
		if (id == null) {
			this.result.notFound();
		} else if (title.length() > 50) {
			this.result.redirectTo(this).viewNews(id, 1, "danger", "O título não pode exceder 50 caracteres.");
		} else if (description.length() > 1000) {
			this.result.redirectTo(this).viewNews(id, 1, "danger", "A descrição não pode exceder 1000 caracteres.");
		} else {
			News news = this.bs.exists(id, News.class);
			if (news == null) {
				this.result.notFound();
			} else {
				News updated_news = this.bs.updateNews(news, title, description, hidden);
				if (updated_news == null) {
					this.result.redirectTo(this).viewNews(news.getId(), 1, "danger", "Houve um erro e as informações não foram atualizadas. Tente novamente.");
				} else {
					this.result.redirectTo(this).viewNews(updated_news.getId(), 1, "success", "As informações foram atualizadas com sucesso.");
				}
			}
		}
	}
	
	@Post(value="/news/{id}/updateImages")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateNewsImages(Long id, UploadedFile image1, UploadedFile image2, UploadedFile image3) throws IOException {
		if (id == null) {
			this.result.notFound();
		} else {
			News news = this.bs.exists(id, News.class);
			if (news == null) {
				this.result.notFound();
			} else {
				if (image1 == null && image2 == null && image3 == null) {
					this.result.redirectTo(this).viewNews(id, 2, "danger", "Nenhum arquivo foi selecionado. Tente novamente.");
				} else {
					List<ImageNews> listImages = this.image_news_bs.listImagesFromNews(news);
					if (image1 != null) {
						if (listImages.size() >= 1) {
							this.image_news_bs.detachImage(listImages.get(0));
						}
						String image1FileName = "news-" + news.getId() + "-image1" + image1.getFileName();
						File image1File = new File(SystemConfigs.getConfig("sys.imagedir"), image1FileName);
						FileOutputStream out1 = new FileOutputStream(image1File, false);
						IOUtils.copy(image1.getFile(), out1);
						out1.close();
						this.image_news_bs.registerImageNews(news, image1File.getAbsolutePath(), image1.getContentType());
					}
					if (image2 != null) {
						if (listImages.size() >= 2) {
							this.image_news_bs.detachImage(listImages.get(1));
						}
						String image2FileName = "news-" + news.getId() + "-image2" + image2.getFileName();
						File image2File = new File(SystemConfigs.getConfig("sys.imagedir"), image2FileName);
						FileOutputStream out2 = new FileOutputStream(image2File, false);
						IOUtils.copy(image2.getFile(), out2);
						out2.close();
						this.image_news_bs.registerImageNews(news, image2File.getAbsolutePath(), image2.getContentType());
					}
					if (image3 != null) {
						if (listImages.size() >= 3) {
							this.image_news_bs.detachImage(listImages.get(2));
						}
						String image3FileName = "news-" + news.getId() + "-image3" + image3.getFileName();
						File image3File = new File(SystemConfigs.getConfig("sys.imagedir"), image3FileName);
						FileOutputStream out3 = new FileOutputStream(image3File, false);
						IOUtils.copy(image3.getFile(), out3);
						out3.close();
						this.image_news_bs.registerImageNews(news, image3File.getAbsolutePath(), image3.getContentType());
					}
					this.result.redirectTo(this).viewNews(id, 2, "success", "As informações foram atualizadas com sucesso.");
				}
				
			}
		}
	}
}
