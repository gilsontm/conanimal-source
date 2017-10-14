package br.edu.ifc.concordia.inf.conanimal.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.edu.ifc.concordia.inf.conanimal.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.conanimal.business.ReportFileBS;

@Controller
public class ReportFileController extends AbstractController {

	@Inject ReportFileBS bs;
}
