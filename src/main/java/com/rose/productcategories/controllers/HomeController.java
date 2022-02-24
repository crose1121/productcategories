package com.rose.productcategories.controllers;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rose.productcategories.models.Category;
import com.rose.productcategories.models.Product;
import com.rose.productcategories.services.AppService;

@Controller
public class HomeController {
	
	@Autowired
	AppService appService;
	
	@GetMapping("/")
	public String index(Model model, @ModelAttribute("category") Category category) {
		List<Product> allProducts = appService.findAllProducts();
		model.addAttribute("allProducts", allProducts);
		return "index.jsp";
	}
	
	@PostMapping("/categories/create")
	public String createCategory(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("allProducts", appService.findAllProducts());
			return "index.jsp";
		}
		else {
			appService.createCategory(category);
			return "redirect:/";
		}
	}
	
	@GetMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model) {
		Product product = appService.findOneProduct(id).orElse(null);
//		List<Category> allCategories = appService.findAllCategories();
//		model.addAttribute("allCategories", allCategories);
		List<Category> unrelatedCategories = appService.filterProductCategories(product);
		model.addAttribute("categories", unrelatedCategories);
		model.addAttribute(product);
		return "productdetails.jsp";
	}
	
	@PostMapping("/addProductToCategory/{id}")
	public String addProductToCategory(@PathVariable("id") Long productId, @RequestParam("selectedCategory") Long categoryId) {
		appService.joinProductCategory(productId, categoryId);
		return "redirect:/";
	}
}
