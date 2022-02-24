package com.rose.productcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rose.productcategories.models.Category;
import com.rose.productcategories.models.Product;
import com.rose.productcategories.repositories.CategoryRepo;
import com.rose.productcategories.repositories.ProductRepo;

@Service
public class AppService {
	
	@Autowired
	CategoryRepo categoryRepo;
	@Autowired
	ProductRepo productRepo;
	
	//find all products
	public List<Product> findAllProducts() {
		return productRepo.findAll();
	}
	
	public List<Category> findAllCategories() {
		return (List<Category>) categoryRepo.findAll();
	}
	
	//create a new category
	public Category createCategory(Category category) {
		return categoryRepo.save(category);
	}
	
	public Optional<Product> findOneProduct(Long id) {
		return productRepo.findById(id);
	}
	
	public Optional<Category> findOneCategory(Long id) {
		return categoryRepo.findById(id);
	}
	
	
	//add a category to a product
	public void joinProductCategory(Long productId, Long categoryId) {
		Product product = productRepo.findById(productId).orElse(null);
		Category category = categoryRepo.findById(categoryId).orElse(null);
		
		product.getCategories().add(category);
		productRepo.save(product);
	}
	
	public List<Category> filterProductCategories(Product product) {
		return categoryRepo.findByProductsNotContaining(product);
	}
}
