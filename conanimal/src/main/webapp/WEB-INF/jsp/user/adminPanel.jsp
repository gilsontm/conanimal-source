<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

    <div class="container w-75 my-5">
        <div class="jumbotron jumbotron-fluid pt-4">
            <div class="container-fluid w-100">
                <h1 class="display-4 px-4 mt-0"> Painel de Administrador </h1>
                <hr>
                <!-- Instruções de uso -->
                <div class="px-4 mt-5">
                    <h3> Instruções de uso </h3>
                    <hr>
                    <ul>
                        <li> Cada título representa uma seção independente, que pode ser alterada sem que haja alterações nas outras seções. </li>
                        <li> Campos marcados com * são de preenchimento obrigatório.</li>
                        <li> As alterações realizadas por cada administrador poderão ser visualizadas pelos outros administradores. </li>
                    </ul>
                </div>

                <div class="row px-4">
                    <div class="col-6">
                        <!-- Cadastrar novo animal para adoção -->
                        <div class="my-5">
                            <h3> Cadastrar novo animal para adoção </h3>
                            <hr>
                            <c:if test="${formNumber == 1}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <form method="POST" action="<c:url value='/registerAnimal'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="animals_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_title_input" name="title" class="form-control" maxlength="50" placeholder="Título do animal para adoção">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="animals_description_input"> Descrição* </label>
                                    <textarea id="animals_description_input" name="description" class="form-control" rows="5" maxlength="500" aria-describedby="animals_description_description"> </textarea>
                                    <small id="animals_description_description"> Limite de 500 caracteres.</small>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_primary_image_input" class="col-3 col-form-label"> Imagem 1* </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image1">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_image_2_input" class="col-3 col-form-label"> Imagem 2 </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image2">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_image_3_input" class="col-3 col-form-label"> Imagem 3 </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image3">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_image_4_input" class="col-3 col-form-label"> Imagem 4 </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image4">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="animals_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar animal para adoção </button>
                            </form>
                        </div>
                        <!-- Cadastrar nova notícia -->
                        <div class="my-5">
                            <h3> Cadastrar nova notícia</h3>
                            <hr>
                            <form>
                                <div class="form-group row">
                                    <label for="news_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="news_title_input" class="form-control" maxlength="50" placeholder="Título da notícia">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="news_description_input"> Descrição* </label>
                                    <textarea id="news_description_input" class="form-control" rows="5" maxlength="500" aria-describedby="news_description_description"> </textarea>
                                    <small id="news_description_description"> Limite de 500 caracteres.</small>
                                </div>
                                <div class="form-group row">
                                    <label for="news_image_1_input" class="col-3 col-form-label"> Imagem 1 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image1">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="news_image_2_input" class="col-3 col-form-label"> Imagem 2 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image2">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="news_image_3_input" class="col-3 col-form-label"> Imagem 3 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image3">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="news_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar notícia </button>
                            </form>
                        </div>
                        <!-- Cadastrar nova prestação de contas -->
                        <div class="my-5">
                            <h3> Cadastrar nova prestação de contas</h3>
                            <hr>
                            <form>
                                <div class="form-group row">
                                    <label for="accountability_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="accountability_title_input" class="form-control" maxlength="100" placeholder="Título da prestação de contas">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_1_input" class="col-3 col-form-label"> Arquivo 1* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_2_input" class="col-3 col-form-label"> Arquivo 2 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_3_input" class="col-3 col-form-label"> Arquivo 3 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_4_input" class="col-3 col-form-label"> Arquivo 4 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_5_input" class="col-3 col-form-label"> Arquivo 5 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_6_input" class="col-3 col-form-label"> Arquivo 6 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_7_input" class="col-3 col-form-label"> Arquivo 7 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_8_input" class="col-3 col-form-label"> Arquivo 8 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_9_input" class="col-3 col-form-label"> Arquivo 9 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_10_input" class="col-3 col-form-label"> Arquivo 10 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_11_input" class="col-3 col-form-label"> Arquivo 11 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_12_input" class="col-3 col-form-label"> Arquivo 12 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_13_input" class="col-3 col-form-label"> Arquivo 13 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_14_input" class="col-3 col-form-label"> Arquivo 14 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_15_input" class="col-3 col-form-label"> Arquivo 15 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="account_file_16_input" class="col-3 col-form-label"> Arquivo 16 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>

                                <button type="submit" id="accountability_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar prestação de contas </button>
                            </form>
                        </div>
                        <!-- Formulário para alterar seção de parceiros da ONG -->
                        <div class="my-5">
                            <h3> Alterar seção de parceiros da ONG </h3>
                            <hr>

                            <!-- Lista de parceiros cadastrados -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Parceiros cadastrados</li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome do parceiro
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome do parceiro
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome do parceiro
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                            </ul>

                            <!-- Formulário para cadastrar novo parceiro -->
                            <h5> Cadastrar novo parceiro </h5>
                            <hr>
                            <form>
                                <div class="form-group row">
                                    <label for="partner_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="partner_name_input" class="form-control" placeholder="Digite o nome do parceiro">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="partner_image_input" class="col-form-label col-3"> Logomarca* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="partner_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar parceiro e atualizar informações </button>
                            </form>
                        </div>
                        <!-- Formulário para alterar informações de contatos úteis -->
                        <div class="my-5">
                            <h3> Alterar informações de contatos úteis </h3>
                            <hr>
                            <form>
                                <div class="form-group row">
                                    <label for="contact_email_input" class="col-3 col-form-label"> Email* </label>
                                    <div class="col-9">
                                        <input type="email" id="contact_email_input" class="form-control" value="conanimal@gmail.com">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact_facebook_input" class="col-3 col-form-label"> Facebook* </label>
                                    <div class="col-9">
                                        <input type="text" id="contact_facebook_input" class="form-control" value="www.facebook.com/ongconanimal">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact_link1_input" class="col-3 col-form-label"> Link útil 1 </label>
                                    <div class="col-9">
                                        <input type="text" id="contact_link1_input" class="form-control" value="www.uipa.org.br">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact_link2_input" class="col-3 col-form-label"> Link útil 2 </label>
                                    <div class="col-9">
                                        <input type="text" id="contact_link2_input" class="form-control" value="www.amparaanimal.org.br">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact_link3_input" class="col-3 col-form-label"> Link útil 3 </label>
                                    <div class="col-9">
                                        <input type="text" id="contact_link3_input" class="form-control" placeholder="Adicione um link">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact_link4_input" class="col-3 col-form-label"> Link útil 4 </label>
                                    <div class="col-9">
                                        <input type="text" id="contact_link4_input" class="form-control" placeholder="Adicione um link">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact_link5_input" class="col-3 col-form-label"> Link útil 5 </label>
                                    <div class="col-9">
                                        <input type="text" id="contact_link5_input" class="form-control" placeholder="Adicione um link">
                                    </div>
                                </div>

                                <button type="submit" id="contact_submit_button" class="btn btn-block btn-danger mt-4"> Atualizar informações </button>
                            </form>
                        </div>
                        <!-- Alterar imagens da página inicial -->
                        <div class="my-5">
                            <h3> Alterar imagens da página inicial </h3>
                            <hr>
                            <!-- Lista das imagens atuais -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Imagens cadastradas</li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome da imagem
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome da imagem
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome da imagem
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                            </ul>

                            <h5> Cadastrar nova imagem </h5>
                            <hr>
                            <!-- Cadastrar nova imagem para a página inicial -->
                            <form>
                                <div class="form-group row">
                                    <label for="main_image_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="main_image_name_input" class="form-control" placeholder="Digite um nome para a imagem">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="main_image_input" class="col-form-label col-3"> Imagem* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="main_image_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar imagem e atualizar informações </button>
                            </form>
                        </div>
                        <!-- Alterar arquivos PDF do estatuto -->
                        <div class="my-5">
                            <h3> Alterar arquivos PDF do estatuto </h3>
                            <hr>
                            <!-- Lista de arquivos atuais -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Arquivos cadastrados </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome do arquivo
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome do arquivo
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome do arquivo
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                            </ul>


                            <h5> Cadastrar novo arquivo PDF </h5>
                            <hr>
                            <!-- Cadastrar novo arquivo -->
                            <form>
                                <div class="form-group row">
                                    <label for="statute_file_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="statute_file_name_input" class="form-control" maxlength="50" placeholder="Digite um nome para o arquivo">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="statute_file_input" class="col-form-label col-3"> Arquivo PDF* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="statute_file_submit_button" class="btn btn-block btn-danger mt-4"> Adicionar arquivo e atualizar informações </button>
                            </form>
                        </div>
                        <!-- Alterar arquivos PDF da legislação -->
                        <div class="my-5">
                            <h3> Alterar arquivos PDF da legislação </h3>
                            <hr>
                            <!-- Lista de arquivos atuais -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Arquivos cadastrados </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    Nome do arquivo
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </li>
                            </ul>

                            <h5> Cadastrar novo arquivo PDF </h5>
                            <hr>
                            <!-- Cadastrar novo arquivo -->
                            <form>
                                <div class="form-group row">
                                    <label for="legislation_file_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="legislation_file_name_input" class="form-control" maxlength="50" placeholder="Digite um nome para o arquivo">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="legislation_file_input" class="col-form-label col-3"> Arquivo PDF* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="legislation_file_submit_button" class="btn btn-block btn-danger mt-4"> Adicionar arquivo e atualizar informações </button>
                            </form>
                        </div>
                        <!-- Alterar slogan -->
                        <div class="mt-5">
                            <h3> Alterar slogan da página principal </h3>
                            <hr>
                            <form>
                                <div class="form-group row">
                                    <label for="slogan_text_input" class="col-form-label col-3"> Slogan* </label>
                                    <div class="col-9">
                                        <input type="text" id="slogan_text_input" class="form-control" maxlength="55" value="Porque o seu melhor amigo merece muito carinho!">
                                    </div>
                                </div>

                                <button type="submit" id="slogan_submit_input" class="btn btn-block btn-danger mt-4"> Alterar slogan </button>
                            </form>
                        </div>
                    </div>
                    <div class="col-6">
                        <!-- Lista de usuários -->
                        <div class="my-5">
                            <h3> Lista de usuários </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#admin_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="admin_collapse">
                                Administradores
                            </a>
                            <div class="collapse" id="admin_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${users}" var="eachUser">
                                		<c:if test="${eachUser.getAccess() >= adminAccessLevel}"> 
                                			<a href="<c:url value='/viewUser${eachUser.getId()}'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                                				${eachUser.getName()}
                                				<span class="badge badge-danger">${eachUser.getIsLegalPerson() ? "Pessoa Jurídica" : "Pessoa Física"}</span>
                                			</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#user_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="user_collapse">
                                Usuários ativos 
                                
                            </a>
                            <div class="collapse" id="user_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${users}" var="eachUser">
                                		<c:if test="${eachUser.getActive()}"> 
                                			<a href="<c:url value='/viewUser${eachUser.getId()}'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                                				${eachUser.getName()}
                                				<span class="badge badge-danger">${eachUser.getIsLegalPerson() ? "Pessoa Jurídica" : "Pessoa Física"}</span>
                                			</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#disabled_user_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="disabled_user_collapse">
                                Usuários desativados
                            </a>
                            <div class="collapse" id="disabled_user_collapse">
                                <ul class="list-group">
                                    <c:forEach items="${users}" var="eachUser">
                                		<c:if test="${not eachUser.getActive()}"> 
                                			<a href="<c:url value='/viewUser${eachUser.getId()}'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                                				${eachUser.getName()}
                                				<span class="badge badge-danger">${eachUser.getIsLegalPerson() ? "Pessoa Jurídica" : "Pessoa Física"}</span>
                                			</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- Lista de animais para adoção -->
                        <div class="my-5">
                            <h3> Lista de animais cadastrados </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#animals_to_be_adopted_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="animals_to_be_adopted_collapse">
                                Animais para adoção
                            </a>
                            <div class="collapse" id="animals_to_be_adopted_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${animals}" var="eachAnimal">
                                		<c:if test="${not eachAnimal.getAdopted() and not eachAnimal.getHidden()}">
                                			<a href="<c:url value='/viewAnimal${eachAnimal.getId()}'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachAnimal.getTitle()}                       			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#adopted_animals_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="adopted_animals_collapse">
                                Animais adotados
                            </a>
                            <div class="collapse" id="adopted_animals_collapse">
                                <ul class="list-group">
                                    <c:forEach items="${animals}" var="eachAnimal">
                               			<c:if test="${eachAnimal.getAdopted()}">
                                			<a href="<c:url value='/viewAnimal${eachAnimal.getId()}'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachAnimal.getTitle()}                       			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#hidden_animals_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="hidden_animals_collapse">
                                Animais ocultados
                            </a>
                            <div class="collapse" id="hidden_animals_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${animals}" var="eachAnimal">
                               			<c:if test="${eachAnimal.getHidden()}">
                                			<a href="<c:url value='/viewAnimal${eachAnimal.getId()}'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachAnimal.getTitle()}                       			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- Lista de notícias cadastradas -->
                        <div class="my-5">
                            <h3> Lista de notícias cadastradas </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#news_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="news_collapse">
                                Notícias visíveis
                            </a>
                            <div class="collapse" id="news_collapse">
                                <ul class="list-group">
                                    <a href="visualizar-noticia.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da notícia <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-noticia.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da notícia <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-noticia.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da notícia <small> DD/MM/AAAA </small> </a>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#hidden_news_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="hidden_news_collapse">
                                Notícias ocultadas
                            </a>
                            <div class="collapse" id="hidden_news_collapse">
                                <ul class="list-group">
                                    <a href="visualizar-noticia.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da notícia <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-noticia.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da notícia <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-noticia.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da notícia <small> DD/MM/AAAA </small> </a>
                                </ul>
                            </div>
                        </div>
                        <!-- Lista de prestações de contas -->
                        <div class="mt-5">
                            <h3> Lista de prestações de contas </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#accountability_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="accountability_collapse">
                                Prestações de contas visíveis
                            </a>
                            <div class="collapse" id="accountability_collapse">
                                <ul class="list-group">
                                    <a href="visualizar-prestacao-de-conta.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da prestação de contas <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-prestacao-de-conta.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da prestação de contas <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-prestacao-de-conta.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da prestação de contas <small> DD/MM/AAAA </small> </a>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#hidden_accountability_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="hidden_accountability_collapse">
                                Prestações de contas ocultas
                            </a>
                            <div class="collapse" id="hidden_accountability_collapse">
                                <ul class="list-group">
                                    <a href="visualizar-prestacao-de-conta.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da prestação de contas <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-prestacao-de-conta.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da prestação de contas <small> DD/MM/AAAA </small> </a>
                                    <a href="visualizar-prestacao-de-conta.html" class="list-group-item list-group-item-action d-flex justify-content-between"> Título da prestação de contas <small> DD/MM/AAAA </small> </a>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<c:import url="/includes/footers.jsp"/>