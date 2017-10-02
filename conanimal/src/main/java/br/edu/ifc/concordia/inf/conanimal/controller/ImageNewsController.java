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
import br.edu.ifc.concordia.inf.conanimal.business.ImageNewsBS;
import br.edu.ifc.concordia.inf.conanimal.business.NewsBS;
import br.edu.ifc.concordia.inf.conanimal.model.ImageAnimal;
import br.edu.ifc.concordia.inf.conanimal.model.ImageNews;
import br.edu.ifc.concordia.inf.conanimal.model.News;

@Controller
public class ImageNewsController extends AbstractController {
	
	@Inject ImageNewsBS bs;
	@Inject NewsBS news_bs;
	
	@Get(value="/news/{id}/imageNews/{number}")
	@NoCache
	public void getNewsImage(Long id, Integer number) {
		if ((0 < number) && (number < 4)) { 
			try {
				News news = this.news_bs.exists(id, News.class);
				if (news == null) {
					this.result.notFound();
				} else {
					List<ImageNews> images_list = this.bs.listImagesFromNews(news);
					if(images_list.size() >= number) {
						File file = new File(images_list.get(number - 1).getImagePath());
						FileInputStream in = new FileInputStream(file);
						this.response.setContentType(images_list.get(number - 1).getImageContentType());
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
