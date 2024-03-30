package webfood.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import webfood.entity.CategoryEntity;
import webfood.entity.FoodEntity;
import webfood.service.CategoryService;
import webfood.service.FoodService;

@Controller(value = "foodControllerOfAdmin")
public class FoodController {
	@Autowired
	private FoodService foodService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/admin/food/list-food", method = RequestMethod.GET)
	public ModelAndView showListFood(@ModelAttribute("model") FoodEntity foodEntity) {
		ModelAndView mav = new ModelAndView("admin/food/list_food");
		mav.addObject("list_food", foodService.listAllFood());
		return mav;
	}

	@RequestMapping(value = "/admin/food/add-food", method = RequestMethod.GET)
	public ModelAndView addFood(@ModelAttribute("model") CategoryEntity categoryEntity) {
		ModelAndView mav = new ModelAndView("admin/food/add_food");
		mav.addObject("list_category", categoryService.getAllCategories());
		return mav;
	}

	@PostMapping("/admin/food/save-food")
	public String saveFood(@ModelAttribute("food-model") FoodEntity foodEntity,
			@RequestParam(value = "categoryId", required = false) Long category,
			@RequestParam(value = "image", required = false) MultipartFile file) throws IOException {
		System.out.println(category);
		if (!file.isEmpty()) {

			byte[] bytes = file.getBytes();
			String nameFile = file.getOriginalFilename();
			Path path = Paths
					.get("D:\\Eclipse\\ChuyenDe1\\webfood\\src\\main\\webapp\\template\\admin\\assets\\upload\\MonAn\\"
							+ nameFile);
			Files.write(path, bytes);

			CategoryEntity categoryEntity = new CategoryEntity();
			categoryEntity.setCategoryId(category);
			foodEntity.setCategory(categoryEntity);
			foodEntity.setFoodImg(nameFile);
			foodService.saveFood(foodEntity);
		}
		return "redirect:/admin/food/list-food";
	}

	@RequestMapping(value = "/admin/food/delete-food", method = RequestMethod.GET)
	public String deleteFood(@RequestParam(value = "food_id", required = false) long food_id) {
		foodService.deleteFood(food_id);
		return "redirect:/admin/food/list-food";
	}

	@RequestMapping(value = "/admin/food/update-status", method = RequestMethod.GET)
	public String updateStatusFood(@RequestParam(value = "food_id", required = false) long food_id) {
		foodService.updateStatusFood(food_id);
		return "redirect:/admin/food/list-food";
	}

	@RequestMapping(value = "/admin/food/edit-food", method = RequestMethod.GET)
	public ModelAndView editFood(@RequestParam(value = "food_id", required = false) long food_id) {
		ModelAndView mav = new ModelAndView("admin/food/edit_food");
		mav.addObject("food_detail", foodService.editFood(food_id));
		mav.addObject("list_category", categoryService.getAllCategories());
		return mav;
	}

	@RequestMapping(value = "/admin/food/list-food-sale", method = RequestMethod.GET)
	public ModelAndView showListFoodSale() {
		ModelAndView mav = new ModelAndView("admin/food/food-sale/list_food_sale");
		mav.addObject("list_food", foodService.listFoodSale());
		return mav;
	}

	@PostMapping("/admin/food/update-food")
	public String updateCategory(@ModelAttribute("food-model") FoodEntity foodEntity,
			@RequestParam("categoryId") long category_id,
			@RequestParam("imagePhoto") String foodImg,
			@RequestParam(value = "image", required = false) MultipartFile file) {
		System.out.println(foodImg);
		// Nếu file rổng thì set lại ảnh có giá trị name cũ
		if (file.isEmpty()) {
			System.out.println("th1");
			CategoryEntity categoryEntity = new CategoryEntity();
			categoryEntity.setCategoryId(category_id);
			foodEntity.setCategory(categoryEntity);
			
			
			foodEntity.setFoodImg(foodImg);
			foodService.updateFood(foodEntity);
			
		} else { //  nếu file 
			byte[] bytes;
			String imageString = "D:\\Eclipse\\ChuyenDe1\\webfood\\src\\main\\webapp\\template\\admin\\assets\\upload\\MonAn\\"
					+ foodImg;
			File file1 = new File(imageString);
			if (file1.exists()) {
				if (file1.delete()) {
					System.out.println("File đã xóa khỏi thư mục!");
				} else {
					System.out.println("File chưa xóa!");
				}
			}
			try {
				bytes = file.getBytes();
				String nameFile = UUID.randomUUID() + file.getOriginalFilename();
				Path path = Paths.get(
						"D:\\Eclipse\\ChuyenDe1\\webfood\\src\\main\\webapp\\template\\admin\\assets\\upload\\MonAn\\"
								+ nameFile);
				CategoryEntity categoryEntity = new CategoryEntity();
				categoryEntity.setCategoryId(category_id);
				foodEntity.setCategory(categoryEntity);
				
				
				foodEntity.setFoodImg(foodImg);
				foodService.updateFood(foodEntity);
				
				Files.write(path, bytes);
			} catch (IOException e) {
				System.out.println("Đã có lỗi");
			}

		}
		return "redirect:/admin/food/list-food";
	}

}
