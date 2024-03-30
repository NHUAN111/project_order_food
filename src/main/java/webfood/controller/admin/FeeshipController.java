package webfood.controller.admin;

import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import webfood.entity.CityEntity;
import webfood.entity.DistrictEntity;
import webfood.entity.FeeshipEntity;
import webfood.entity.WardsEntity;
import webfood.service.CityService;
import webfood.service.DistricService;
import webfood.service.FeeshipService;
import webfood.service.WardsService;

@Controller(value = "feeshipControllerOfAdmin")
public class FeeshipController {
	@Autowired
	private CityService cityService;

	@Autowired
	private DistricService districService;

	@Autowired
	private WardsService wardsService;

	@Autowired
	private FeeshipService feeshipService;

	@RequestMapping("/admin/feeship/add-feeship")
	public ModelAndView listAllCity() {
		ModelAndView mav = new ModelAndView("/admin/feeship/add_feeship");
		mav.addObject("list_city", cityService.listAllCities());
		return mav;
	}

	@PostMapping(value = "/admin/feeship/select-delivery", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	@ResponseBody
	public String selectDelivery(@RequestBody CityEntity cityEntity) {

		String output = "";
		if ("city".equals(cityEntity.getAction())) {
			List<DistrictEntity> districtEntities = districService.findEntitiesByIds(cityEntity.getMaTp());
			output += "<option>--Chọn quận huyện--</option>";
			for (DistrictEntity province : districtEntities) {
				output += "<option value=\"" + province.getMaQh() + "\">" + province.getNameQuanhuyen() + "</option>";
			}
		} else {
			List<WardsEntity> wards = wardsService.findEntitiesByIds(cityEntity.getMaTp());
			output += "<option>--Chọn xã phường--</option>";
			for (WardsEntity ward : wards) {
				output += "<option value=\"" + ward.getXaID() + "\">" + ward.getNameXaphuong() + "</option>";

			}
		}

		return output;
	}

	@PostMapping("/admin/feeship/save-delivery")
	public void saveDelivery(@ModelAttribute("feeShip") FeeshipEntity feeshipEntity, HttpServletRequest request,
			HttpServletResponse respone) throws IOException {
		CityEntity cityEntity = new CityEntity();
		cityEntity.setMaTp(Long.parseLong(request.getParameter("feeMatp")));

		DistrictEntity districtEntity = new DistrictEntity();
		districtEntity.setMaQh(Long.parseLong(request.getParameter("feeMaqh")));

		WardsEntity wardsEntity = new WardsEntity();
		wardsEntity.setXaID(Long.parseLong(request.getParameter("feeXaid")));

		feeshipEntity.setCitys(cityEntity);
		feeshipEntity.setDistricts(districtEntity);
		feeshipEntity.setWards(wardsEntity);
		feeshipService.saveFeeShip(feeshipEntity);
		respone.sendRedirect(request.getContextPath() + "/admin/feeship/list-feeship");

	}

	@RequestMapping("/admin/feeship/list-feeship")
	public ModelAndView listFeeShip() {
		ModelAndView mav = new ModelAndView("/admin/feeship/list_feeship");
		mav.addObject("list_feeship", feeshipService.listAllFeeShip());
		return mav;
	}

	@RequestMapping(value = "/admin/feeship/delete-feeship", method = RequestMethod.GET)
	public void deleteFeeship(@RequestParam(value = "fee_id", required = false) long fee_id, HttpServletRequest request,
			HttpServletResponse respone) throws IOException {
		feeshipService.deleteFeeship(fee_id);
		respone.sendRedirect(request.getContextPath() + "/admin/feeship/list-feeship");
	}

	@RequestMapping(value = "/admin/feeship/edit-feeship", method = RequestMethod.GET)
	public ModelAndView editFeeship(@RequestParam(value = "fee_id", required = false) long fee_id) {
		ModelAndView mav = new ModelAndView("admin/feeship/edit_feeship");
		mav.addObject("edit_feeship", feeshipService.editFeeship(fee_id));
		return mav;
	}

	@PostMapping("/admin/feeship/update-feeship")
	public void updateCategory(@ModelAttribute("feeShip") FeeshipEntity feeshipEntity, HttpServletRequest request,
			HttpServletResponse respone) throws IOException {

		System.out.println(feeshipEntity.getFeeId());
		CityEntity cityEntity = new CityEntity();
		cityEntity.setMaTp(Long.parseLong(request.getParameter("feeMatp")));

		DistrictEntity districtEntity = new DistrictEntity();
		districtEntity.setMaQh(Long.parseLong(request.getParameter("feeMaqh")));

		WardsEntity wardsEntity = new WardsEntity();
		wardsEntity.setXaID(Long.parseLong(request.getParameter("feeXaid")));

		if (feeshipEntity.getFeeId() != null) {
			feeshipEntity.setCitys(cityEntity);
			feeshipEntity.setDistricts(districtEntity);
			feeshipEntity.setWards(wardsEntity);

			feeshipService.updateFeeship(feeshipEntity);
			respone.sendRedirect(request.getContextPath() + "/admin/feeship/list-feeship");
		} else {
			
		}

	}

}
