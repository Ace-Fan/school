package com.thinkgem.jeesite.modules.wisdom.web.base;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.crud.BaseCrudController;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.ResultPage;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.Token;
import com.thinkgem.jeesite.modules.adopens.common.Result;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisReceiveAddressDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisReceiveAddress;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisReceiveAddressService;

import net.sf.json.JSONObject;

/**
 * 收货地址信息Controller
 * 
 * @author weekly
 * @version 2019-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/wisReceiveAddress")
public class WisReceiveAddressController
		extends BaseCrudController<WisReceiveAddressService, WisReceiveAddressDao, WisReceiveAddress> {

	String list = "modules/wisdom/base/wisReceiveAddressList"; // 表格页面
	String form = "modules/wisdom/base/wisReceiveAddressForm"; // 表单页面

	// 通用model
	public void model(Model model) {
		WisReceiveAddress wisReceiveAddress = new WisReceiveAddress();
		model.addAttribute("rootUrl", "/wisdom/base/wisReceiveAddress"); // rootUrl 访问路径
		model.addAttribute("tableName", wisReceiveAddress.getTableName()); // tableName 表名
	}

	// JSON对象字符串封装为对象
	public WisReceiveAddress repJson(String json) {
		return (WisReceiveAddress) JSONObject.toBean(toJsonObject(json), WisReceiveAddress.class);
	}

	@ModelAttribute
	public WisReceiveAddress get(@RequestParam(required = false) String id) {
		WisReceiveAddress entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = entityService.get(id);
		}
		if (entity == null) {
			entity = new WisReceiveAddress();
		}
		return entity;
	}

	// 跳转到表格页面
	@RequestMapping(value = { "show", "" })
	public String list(Model model) {
		model(model); // 通用model
		return list;
	}

	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<WisReceiveAddress>> findAllList(WisReceiveAddress wisReceiveAddress) {
		return findList(wisReceiveAddress);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:" + type);
		if (id != null && !"".equals(id)) {
			model.addAttribute("wisReceiveAddress", entityService.get(id));
		}
		return form;
	}

	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json, String tableName) throws Exception {
		WisReceiveAddress wisReceiveAddress = repJson(json);

		if (null != wisReceiveAddress.getId() && !wisReceiveAddress.getId().equals("")) {
			boolean bool = entityService.update(wisReceiveAddress);
			if (bool) {
				result.setCode(2);
				result.setMsg("修改成功");
			} else {
				result.setCode(-2);
				result.setMsg("修改失败");
			}
		} else {
			boolean bool = entityService.insert(wisReceiveAddress);
			if (bool) {
				result.setCode(1);
				result.setMsg("添加成功");
			} else {
				result.setCode(-1);
				result.setMsg("添加失败");
			}
		}
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}

	/**
	 * 删除单个
	 * 
	 * @param id
	 * @param tableName
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	@ResponseBody
	public void delete(String id, HttpServletResponse response) throws Exception {

		Result result = new Result();

		WisReceiveAddress wisReceiveAddress = new WisReceiveAddress();
		wisReceiveAddress.setId(id);

		if (null == id) {
			result.setMsg("ID不能为空");
		} else {
			boolean bool = entityService.delete(wisReceiveAddress);
			if (bool) {
				result.setCode(1);
				result.setMsg("删除成功!");
			} else {
				result.setCode(-1);
				result.setMsg("删除失败!");
			}
		}
		response.getWriter().write(JsonMapper.toJsonString(result));
	}

	/**
	 * 切换指定表指定主键指定字段的值
	 * 
	 * @param colunms
	 *            字段名
	 * @param tableName
	 *            表名
	 * @param id
	 *            主键值
	 * @param value
	 *            切换值
	 * @param response
	 * @throws IOException
	 * 
	 * @author weekly
	 * @version v19.07.29
	 */
	@RequestMapping(value = "/toggleTableColumns", method = { RequestMethod.POST })
	@ResponseBody
	public void toggleTableColumns(String colunms, String tableName, String id, String value,
			HttpServletResponse response) throws IOException {
		tableName = AESUtil.AESDncode("pulsation", tableName); // 解析主表名

		// 传递表名、值、字段、关联ID
		boolean bool = entityService.toggleTableColumns(colunms, tableName, id, value, UserUtils.getUser().getId(),
				new Date());

		if (bool) {
			result.setCode(1);
			result.setMsg("修改成功！");
			result.setSuccess(true);
			result.setData(1);
		} else {
			result.setCode(-1);
			result.setMsg("修改失败");
			result.setSuccess(false);
			result.setData(-1);
		}

		response.getWriter().write(JsonMapper.toJsonString(result));
	}

}