package com.thinkgem.jeesite.api;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.card.utils.Result;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeMsg;
import com.thinkgem.jeesite.modules.sc.service.grade.ScGradeMsgService;

@Controller
@RequestMapping(value = "${frontPath}/gradeApi")
public class GradeMessageApi {
	@Autowired
	private ScGradeMsgService scGradeMsgService;

	// 传递学期获取该学期所有教师评分信息
	@RequestMapping(value = "/getBySemId", method = RequestMethod.POST)
	@ResponseBody
	public  void getBySemId(String semId, HttpServletResponse response, HttpServletRequest request) throws IOException {
		Result result = new Result();
		List<ScGradeMsg> list = scGradeMsgService.getBySemId(semId);
		if (list != null && !list.isEmpty()) {
			result.setMsg("成功");
			result.setData(list);
			result.setCode(10001);
			result.setSuccess(true);
		} else {
			result.setMsg("失败");
			result.setCode(40001);
			result.setSuccess(false);
		}
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}

	// 传递老师获取该教师所有学期评分信息
	@RequestMapping(value = "/getByTeachId", method = RequestMethod.POST)
	@ResponseBody
	public void getByTeachId(String teachId, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		Result result = new Result();
		List<ScGradeMsg> list = scGradeMsgService.getByTeachId(teachId);
		if (list != null && !list.isEmpty()) {
			result.setMsg("成功");
			result.setData(list);
			result.setCode(10001);
			result.setSuccess(true);
		} else {
			result.setMsg("失败");
			result.setCode(40001);
			result.setSuccess(false);
		}
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}
}
