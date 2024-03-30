package webfood.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import webfood.service.CategoryService;

@Controller(value = "categoryControllerOfAdmin")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/admin/category/list", method = RequestMethod.GET)
	public ModelAndView showListCategory() {
		ModelAndView mav = new ModelAndView("admin/category/list");
		mav.addObject("list_category", categoryService.getAllCategories());
		return mav;
	}

	@RequestMapping(value = "/admin/category/add", method = RequestMethod.GET)
	public ModelAndView addCategory() {
		ModelAndView mav = new ModelAndView("admin/category/add");
		return mav;
	}

	@PostMapping("/admin/category/save")
	public void saveCategory(@ModelAttribute("category") CategoryEntity categoryEntity,
			HttpServletRequest request,
			HttpServletResponse respone,
			@RequestParam(value = "image") MultipartFile file) throws IOException {
		if (!file.isEmpty()) {
			byte[] bytes = file.getBytes();
			String nameFile = file.getOriginalFilename();
			Path pathNew = Paths.get(
					"D:\\Eclipse\\ChuyenDe1\\webfood\\src\\main\\webapp\\template\\admin\\assets\\upload\\TheLoai\\"
							+ nameFile);
			
			Files.write(pathNew, bytes);
			
			categoryEntity.setCategoryImg(nameFile);
			categoryService.saveCategory(categoryEntity);
		}
		
		respone.sendRedirect(request.getContextPath()+"/admin/category/list");
	
	}

	@RequestMapping(value = "/admin/category/delete", method = RequestMethod.GET)
	public String deleteCategory(@RequestParam(value = "category_id", required = false) int category_id,
			HttpServletRequest request) {
		categoryService.deleteCategory(category_id);
		return "redirect:/admin/category/list";
	}

	@RequestMapping(value = "/admin/category/update-status", method = RequestMethod.GET)
	public String updateStatusCategory(@RequestParam(value = "category_id", required = false) int category_id,
			HttpServletRequest request) {
		categoryService.updateStatusCategory(category_id);
		return "redirect:/admin/category/list";
	}

	@RequestMapping(value = "/admin/category/edit", method = RequestMethod.GET)
	public ModelAndView editCategory(@RequestParam(value = "category_id", required = false) int category_id,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/category/edit");
		mav.addObject("detail_category", categoryService.editCategory(category_id));
		return mav;
	}

	@PostMapping("/admin/category/update")
	public String updateCategory(@ModelAttribute("category") CategoryEntity category,
			@RequestParam("imagePhoto") String categoryImg,
			@RequestParam(value = "image", required = false) MultipartFile file) {
		System.out.println(categoryImg);
		if (file.isEmpty()) {
			System.out.println("th1");
			category.setCategoryImg(categoryImg);
			categoryService.updateCategory(category);
		} else {
			byte[] bytes;
			String imageString = "D:\\Eclipse\\ChuyenDe1\\webfood\\src\\main\\webapp\\template\\admin\\assets\\upload\\TheLoai\\"
					+ categoryImg;
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
						"D:\\Eclipse\\ChuyenDe1\\webfood\\src\\main\\webapp\\template\\admin\\assets\\upload\\TheLoai\\"
								+ nameFile);
				category.setCategoryImg(categoryImg);
				categoryService.updateCategory(category);
				Files.write(path, bytes);
			} catch (IOException e) {
				System.out.println("Đã có lỗi");
			}

		}
		return "redirect:/admin/category/list";
	}

	/*
	 * @RequestMapping(value = { "/admin/category/load-categories" })
	 * @ResponseBody public String loadCategories() { List<CategoryEntity>
	 * categoryEntities = categoryService.getAllCategories(); return
	 * printCategories(categoryEntities); }
	 */

	/*
	 * private String printCategories(List<CategoryEntity> categoryEntities) {
	 * String string = new String(); if (categoryEntities.size() > 0) { for
	 * (CategoryEntity categoryEntity : categoryEntities) { string += "<tr>\n" +
	 * "\t<td>" + categoryEntity.getCategoryId() + "</td>\n" + "\t<td>" +
	 * categoryEntity.getCategoryName() + "</td>\n" +
	 * "\t<td><img src=\"/images/category/" + categoryEntity.getCategoryImg() +
	 * "\" alt=\"\"></td>\n" + "\t<td></td>\n" + "\t<td>\n" + "\t\t<div>\n" +
	 * "\t\t\t<a class=\"delete-category\">\n" +
	 * "\t\t\t\t<i class=\"mdi mdi mdi-delete-forever\" style=\"color: red; margin-right: 10px; font-size: 1.4rem\"></i>\n"
	 * + "\t\t\t</a> <a href=\"\">\n" +
	 * "\t\t\t\t<i class=\"mdi mdi-open-in-new\" style=\"color: green; font-size: 1.2rem\"></i>\n"
	 * + "\t\t\t</a>\n" + "\t\t</div>\n" + "\t</td>\n" + "</tr>\n"; } } else {
	 * string += "<tr>\n" + "\t<td>Dữ liệu trống</td>\n" + "</tr>"; } return string;
	 * }
	 */

}
