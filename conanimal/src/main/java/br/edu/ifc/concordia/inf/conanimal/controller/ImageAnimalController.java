package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.util.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.view.Results;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.AnimalBS;
import br.edu.ifc.concordia.inf.conanimal.business.ImageAnimalBS;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.ImageAnimal;

@Controller
public class ImageAnimalController extends AbstractController {
	
	@Inject private AnimalBS animal_bs;
	@Inject private ImageAnimalBS image_animal_bs;
	@Inject private HttpServletResponse response;
	
	@Get(value="/animal/{id}/imageAnimal/{number}")
	@NoCache
	public void getImageAnimal(Long id, Integer number) {
		if ((0 < number) && (number < 4)) { 
			try {
				Animal animal = this.animal_bs.exists(id, Animal.class);
				if (animal == null) {
					this.result.notFound();
				} else {
					List<ImageAnimal> images_list = this.image_animal_bs.listImagesFromAnimal(animal);
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
