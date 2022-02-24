package com.rose.productcategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rose.productcategories.models.Category;
import com.rose.productcategories.models.Product;

@Repository
public interface CategoryRepo extends CrudRepository<Category, Long> {
	//get a list of categories associated with a product, as long as that product 	is not in the category's product list
	List<Category> findByProductsNotContaining(Product product);
}
