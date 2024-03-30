package webfood.controller.admin;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import webfood.entity.SlideEntity;
import webfood.service.SlideService;

@Controller(value = "slideControllerOfAdmin")
public class SlideController {
	@Autowired
	private SlideService slideService;
	
	@RequestMapping(value = "/admin/slide/add-slide", method = RequestMethod.GET)
	public ModelAndView addSlides() {
		ModelAndView mav = new ModelAndView("/admin/slide/add_slide");
		return mav;
	}
	
	@RequestMapping(value = "/admin/slide/list-slide", method = RequestMethod.GET)
	public ModelAndView listSlides() {
		ModelAndView mav = new ModelAndView("/admin/slide/list_slide");
		mav.addObject("list_slide", slideService.listSlides());
		return mav;
	}
	
	@RequestMapping(value = "/admin/slide/delete-slide",  method = RequestMethod.GET)
	public String deleteSlide(@RequestParam("slider_id") long slider_id) {
		slideService.deleteSlide(slider_id);
		return "redirect:/admin/slide/list-slide";
	}
	
	@PostMapping("/admin/slide/save-slide")
	public String saveSlide(
			@RequestParam("files") MultipartFile[] files) {
		for (MultipartFile file : files) {
            String uploadPath = "D:\\Eclipse\\ChuyenDe1\\webfood\\src\\main\\webapp\\template\\admin\\assets\\upload\\slider\\"; // 
            String fileName = file.getOriginalFilename();
            File saveFile = new File(uploadPath + fileName);
            
            SlideEntity slideEntity = new SlideEntity();
            slideEntity.setSliderName(fileName);
            slideEntity.setSliderImg(fileName);
            slideService.saveSlide(slideEntity);
            
            try {
                file.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		return "redirect:/admin/slide/list-slide";
	}
	
}
