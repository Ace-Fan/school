package com.thinkgem.jeesite.modules.base.web;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.base.service.BaseGroupTableService;
import com.thinkgem.jeesite.modules.base.util.GetOrgUtil;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.card.utils.Result;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wm.util.ImageUtils;

/**
 * 通用组件
 * @author weekly
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/base/group")
public class BaseGroupTableController extends BaseController {
	
	private Result results = new Result(); // 消息工具类;
	
	@Autowired
	private BaseGroupTableService baseGroupTableService;
	
	/**
	 * 获取网络图片的宽高
	 * @param url
	 * @return String
	 */
	@RequestMapping(value = "/getImgConfig", method = RequestMethod.POST)
	@ResponseBody
	public String getWidthAndHeight(String url) {
		url = GetOrgUtil.getUrlValue("imgServerPath") + url;
		return ImageUtils.getWidthAndHeight(url);
	}
	
	/**
	 * 删除单个
	 * @param id
	 * @param tableName
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteOne", method = {RequestMethod.POST})
	@ResponseBody
	public void delete(String id, String tableName, HttpServletResponse response)throws Exception {
		tableName = AESUtil.AESDncode("pulsation", tableName); // 解析主表名
		
		if(null == id) {
			results.setMsg("ID不能为空");
		} else {
			boolean bool = baseGroupTableService.deleteOne(tableName,id);
			if(bool) {
				results.setCode(1);
				results.setMsg("删除成功!");
			} else {
				results.setCode(-1);
				results.setMsg("删除失败!");
			}
		}
		response.getWriter().write(JsonMapper.toJsonString(results));
	}
	
	/**
	 * 批量删除
	 * @param id
	 * @param tableName
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/batchDelete", method = { RequestMethod.POST })
	@ResponseBody
	public void delete(String[] id, String tableName, HttpServletResponse response) throws Exception {
		
		tableName = AESUtil.AESDncode("pulsation", tableName); // 解析主表名
		
		boolean bool = baseGroupTableService.batchDelete(id, "del_flag", tableName);
		
		if (bool) {
			results.setCode(1);
			results.setMsg("删除成功!");
		} else {
			results.setCode(-1);
			results.setMsg("删除失败!");
		}
		
		response.getWriter().write(JsonMapper.toJsonString(results));
	}

	/**
	 * 切换指定表指定主键指定字段的值
	 * 
	 * @param colunms		字段名
	 * @param tableName		表名
	 * @param id			主键值
	 * @param value			切换值
	 * @param response
	 * @throws IOException
	 * 
	 * @author weekly
	 * @version v19.07.29 
	 */
	@RequestMapping(value="/toggleTableColumns",method = {RequestMethod.POST})
	@ResponseBody
	public void toggleTableColumns(String colunms, String tableName, String id, String value, HttpServletResponse response) throws IOException {
		tableName = AESUtil.AESDncode("pulsation", tableName); // 解析主表名
		
		// 传递表名、值、字段、关联ID
		boolean bool = baseGroupTableService.toggleTableColumns(colunms, tableName,id, value, UserUtils.getUser().getId(), new Date());
		
		if(bool) {
			results.setCode(1);
			results.setMsg("修改成功！");
			results.setSuccess(true);
			results.setData(1);
		} else {
			results.setCode(-1);
			results.setMsg("修改失败");
			results.setSuccess(false);
			results.setData(-1);
		}
		
		response.getWriter().write(JsonMapper.toJsonString(results));
	}
}