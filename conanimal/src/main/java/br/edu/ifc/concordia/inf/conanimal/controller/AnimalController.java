package br.edu.ifc.concordia.inf.conanimal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.util.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.view.Results;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.AnimalBS;
import br.edu.ifc.concordia.inf.conanimal.business.ImageAnimalBS;
import br.edu.ifc.concordia.inf.conanimal.model.Animal;
import br.edu.ifc.concordia.inf.conanimal.model.ImageAnimal;
import br.edu.ifc.concordia.inf.conanimal.properties.SystemConfigs;
import br.edu.ifc.concordia.inf.permission.Permission;
import br.edu.ifc.concordia.inf.permission.UserRoles;

@Controller
public class AnimalController extends AbstractController {
	
	@Inject private AnimalBS bs;
	@Inject private ImageAnimalBS image_animal_bs;
	@Inject private HttpServletResponse response;
	
	@Post(value="/animal/register")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void registerAnimal(String title, String description, UploadedFile image1, UploadedFile image2, UploadedFile image3, UploadedFile image4) throws IOException {
		if (!GeneralUtils.isEmpty(title) && !GeneralUtils.isEmpty(description) && (image1 != null))  {
			if (title.length() > 50) {
				this.result.redirectTo(UserController.class).adminPanel(1, "danger", "O título não pode exceder 50 caracteres.");
			} else if (description.length() > 1000) {
				this.result.redirectTo(UserController.class).adminPanel(1, "danger", "A descrição não pode exceder 1000 caracteres.");
			} else {
				Animal animal = this.bs.registerAnimal(this.userSession.getUser(), title, description);
				if (animal == null) {
					this.result.redirectTo(UserController.class).adminPanel(1, "danger", "Houve um erro durante o registro. Tente novamente.");
				} else {
					String image1FileName = "animal-" + animal.getId() + "-main-image" + image1.getFileName();
					File image1File = new File(SystemConfigs.getConfig("sys.imagedir"), image1FileName);
					FileOutputStream out = new FileOutputStream(image1File, false);
					IOUtils.copy(image1.getFile(), out);
					out.close();
					this.bs.setAnimalImage(animal, image1File.getAbsolutePath(), image1.getContentType());
					
					if (image2 != null) {
						String image2FileName = "animal-" + animal.getId() + "-image2" + image2.getFileName();
						File image2File = new File(SystemConfigs.getConfig("sys.imagedir"), image2FileName);
						FileOutputStream out2 = new FileOutputStream(image2File, false);
						IOUtils.copy(image2.getFile(), out2);
						out2.close();
						this.image_animal_bs.registerImageAnimal(animal, image2File.getAbsolutePath(), image2.getContentType());
					}
					if (image3 != null) {
						String image3FileName = "animal-" + animal.getId() + "-image3" + image3.getFileName();
						File image3File = new File(SystemConfigs.getConfig("sys.imagedir"), image3FileName);
						FileOutputStream out3 = new FileOutputStream(image3File, false);
						IOUtils.copy(image3.getFile(), out3);
						out3.close();
						this.image_animal_bs.registerImageAnimal(animal, image3File.getAbsolutePath(), image3.getContentType());
					}
					if (image4 != null) {
						String image4FileName = "animal-" + animal.getId() + "-image4" + image4.getFileName();
						File image4File = new File(SystemConfigs.getConfig("sys.imagedir"), image4FileName);
						FileOutputStream out4 = new FileOutputStream(image4File, false);
						IOUtils.copy(image4.getFile(), out4);
						out4.close();
						this.image_animal_bs.registerImageAnimal(animal, image4File.getAbsolutePath(), image4.getContentType());
					}
					
					this.result.redirectTo(UserController.class).adminPanel(1, "success", "Animal cadastrado com sucesso.");
				}
			}
		} else {
			this.result.redirectTo(UserController.class).adminPanel(1, "danger", "Alguns campos não foram preenchidos corretamente.");
		}
	}
	
	@Get(value="/animal/{id}/image")
	@NoCache
	public void getAnimalImage(Long id) {
		try {
			Animal animal = this.bs.exists(id, Animal.class);
			if (animal == null) {
				this.result.notFound();
			} else {
				File file = new File(animal.getMainImage());
				FileInputStream in = new FileInputStream(file);
				this.response.setContentType(animal.getMainImageContentType());
				IOUtils.copy(in, this.response.getOutputStream());
				this.response.getOutputStream().close();
				in.close();
				this.result.nothing();
			}
		} catch (Throwable ex) {
			LOGGER.error(ex);
			this.result.use(Results.status()).badRequest(ex.getMessage());
		}
	}
	
	@Get(value="/animal/{id}/view")
	@NoCache
	public void viewAnimal(Long id, Integer formNumber, String status, String message) {
		if (id == null) {
			this.result.notFound();
		} else {
			Animal current_animal = this.bs.exists(id, Animal.class);
			if (current_animal == null) {
				this.result.notFound();
			} else {
				this.result.include("currentAnimal", current_animal);
				this.result.include("user", this.userSession.getUser());
				this.result.include("adminAccessLevel", UserRoles.ADMIN.getAccessLevel());
				this.result.include("numberSecondaryImages", this.image_animal_bs.listImagesFromAnimal(current_animal).size());
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
	
	@Post(value="/animal/{id}/view")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateAnimal(Long id, String title, String description, Boolean adopted, Boolean hidden) {
		if (id == null) {
			this.result.notFound();
		} else if (title.length() > 50) {
			this.result.redirectTo(this).viewAnimal(id, 1, "danger", "O título não pode exceder 50 caracteres.");
		} else if (description.length() > 1000) {
			this.result.redirectTo(this).viewAnimal(id, 1, "danger", "A descrição não pode exceder 1000 caracteres.");
		} else {
			Animal animal = this.bs.exists(id, Animal.class);
			if (animal == null) {
				this.result.notFound();
			} else {
				Animal updated_animal = this.bs.updateAnimal(animal, title, description, adopted, hidden);
				if (updated_animal == null) {
					this.result.redirectTo(this).viewAnimal(animal.getId(), 1, "danger", "Houve um erro e as informações não foram atualizadas. Tente novamente.");
				} else {
					this.result.redirectTo(this).viewAnimal(updated_animal.getId(), 1, "success", "As informações foram atualizadas com sucesso.");
				}
			}
		}
	}
	
	@Post(value="/animal/{id}/updateMainImage")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateMainImage(Long id, UploadedFile image) throws IOException {
		if (id == null) {
			this.result.notFound();
		} else {
			Animal animal = this.bs.exists(id, Animal.class);
			if (animal == null) {
				this.result.notFound();
			} else {
				if (image == null) {
					this.result.redirectTo(this).viewAnimal(id, 2, "danger", "O arquivo não foi selecionado. Tente novamente.");
				} else {
					String imageFileName = "animal-" + animal.getId() + "-main-image" + image.getFileName();
					File imageFile = new File(SystemConfigs.getConfig("sys.imagedir"), imageFileName);
					FileOutputStream out = new FileOutputStream(imageFile, false);
					IOUtils.copy(image.getFile(), out);
					out.close();
					this.bs.setAnimalImage(animal, imageFile.getAbsolutePath(), image.getContentType());
					this.result.redirectTo(this).viewAnimal(id, 2, "success", "Imagem atualizada com sucesso.");
				}
			}
		}
	}
	
	@Post(value="/animal/{id}/updateImages")
	@NoCache
	@Permission(UserRoles.ADMIN)
	public void updateSecondaryImages(Long id, UploadedFile image2, UploadedFile image3, UploadedFile image4) throws IOException {
		if (id == null) {
			this.result.notFound();
		} else {
			Animal animal = this.bs.exists(id, Animal.class);
			if (animal == null) {
				this.result.notFound();
			} else {
				if (image2 == null && image3 == null && image4 == null) {
					this.result.redirectTo(this).viewAnimal(id, 3, "danger", "Nenhum arquivo foi selecionado. Tente novamente.");
				} else {
					List<ImageAnimal> listSecondaryImages = this.image_animal_bs.listImagesFromAnimal(animal);
					if (image2 != null) {
						if (listSecondaryImages.size() >= 1) {
							this.image_animal_bs.detachImage(listSecondaryImages.get(0));
						}
						String image2FileName = "animal-" + animal.getId() + "-image2" + image2.getFileName();
						File image2File = new File(SystemConfigs.getConfig("sys.imagedir"), image2FileName);
						FileOutputStream out2 = new FileOutputStream(image2File, false);
						IOUtils.copy(image2.getFile(), out2);
						out2.close();
						this.image_animal_bs.registerImageAnimal(animal, image2File.getAbsolutePath(), image2.getContentType());
					}
					if (image3 != null) {
						if (listSecondaryImages.size() >= 2) {
							this.image_animal_bs.detachImage(listSecondaryImages.get(1));
						}
						String image3FileName = "animal-" + animal.getId() + "-image3" + image3.getFileName();
						File image3File = new File(SystemConfigs.getConfig("sys.imagedir"), image3FileName);
						FileOutputStream out3 = new FileOutputStream(image3File, false);
						IOUtils.copy(image3.getFile(), out3);
						out3.close();
						this.image_animal_bs.registerImageAnimal(animal, image3File.getAbsolutePath(), image3.getContentType());
					}
					if (image4 != null) {
						if (listSecondaryImages.size() >= 3) {
							this.image_animal_bs.detachImage(listSecondaryImages.get(2));
						}
						String image4FileName = "animal-" + animal.getId() + "-image4" + image4.getFileName();
						File image4File = new File(SystemConfigs.getConfig("sys.imagedir"), image4FileName);
						FileOutputStream out4 = new FileOutputStream(image4File, false);
						IOUtils.copy(image4.getFile(), out4);
						out4.close();
						this.image_animal_bs.registerImageAnimal(animal, image4File.getAbsolutePath(), image4.getContentType());
					}
					this.result.redirectTo(this).viewAnimal(id, 3, "success", "As informações foram atualizadas com sucesso.");
				}
				
			}
		}
	}
	
}
