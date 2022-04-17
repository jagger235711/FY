package org.fkit.hrm.controller;

import org.fkit.hrm.domain.Fy;
import org.fkit.hrm.service.HrmService;
import org.fkit.hrm.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author 肖文吉    36750064@qq.com
 * @version V1.0
 * @Description: 处理非遗请求控制器
 * <br>网站：<a href="http://www.fkit.org">疯狂Java</a>
 */

@Controller
public class FyController {

    /**
     * 自动注入UserService
     */
    @Autowired
    @Qualifier("hrmService")
    private HrmService hrmService;

    /**
     * 处理/login请求
     */
    @RequestMapping(value = "/fy/selectFy")
    public String selectFy(Model model, Integer pageIndex,
                           @ModelAttribute Fy fy) {
        System.out.println("selectFy -->>");
        System.out.println("pageIndex = " + pageIndex);
        System.out.println("fy = " + fy);
        PageModel pageModel = new PageModel();
        System.out.println("getPageIndex = " + pageModel.getPageIndex());
        System.out.println("getPageSize = " + pageModel.getPageSize());
        System.out.println("getRecordCount = " + pageModel.getRecordCount());
        if (pageIndex != null) {
            pageModel.setPageIndex(pageIndex);
        }
        /** 查询非遗信息     */
        List<Fy> fys = hrmService.findFy(fy, pageModel);
        model.addAttribute("fys", fys);
        model.addAttribute("pageModel", pageModel);
        return "fy/fy";

    }

    /**
     * 处理删除非遗请求
     *
     * @param String       ids 需要删除的id字符串
     * @param ModelAndView mv
     */
    @RequestMapping(value = "/fy/removeFy")
    public ModelAndView removeFy(String ids, ModelAndView mv) {
        // 分解id字符串
        String[] idArray = ids.split(",");
        for (String id : idArray) {
            // 根据id删除非遗
            hrmService.removeFyById(Integer.parseInt(id));
        }
        // 设置客户端跳转到查询请求
        mv.setViewName("redirect:/fy/selectFy");
        // 返回ModelAndView
        return mv;
    }

    /**
     * 处理添加请求
     *
     * @param String       flag 标记， 1表示跳转到添加页面，2表示执行添加操作
     * @param Fy           fy  要添加的非遗对象
     * @param ModelAndView mv
     */
    @RequestMapping(value = "/fy/addFy")
    public ModelAndView addFy(
            String flag,
            @ModelAttribute Fy fy,
            ModelAndView mv) {
        if (flag.equals("1")) {
            // 设置跳转到添加页面
            mv.setViewName("fy/showAddFy");
        } else {
            // 执行添加操作
            hrmService.addFy(fy);
            // 设置客户端跳转到查询请求
            mv.setViewName("redirect:/fy/selectFy");
        }
        // 返回
        return mv;
    }


    @RequestMapping(value = "/fy/examineFy")
    /**
     * @Description:
     *                  处理审查请求
     * @Param:
     *                  flag 标记， 1表示跳转到添加页面，2表示执行添加操作
     *                  fy  要添加的非遗对象
     *                  mv
     * @return:
     * @Author: jagger
     * @Date: 2021/10/29
     */
    public ModelAndView examineFy(
            String flag,
            @ModelAttribute Fy fy,
            ModelAndView mv) {
//        if (flag.equals("1")) {
//            // 设置跳转到添加页面
//            mv.setViewName("fy/showExamineFy");
//        } else {
//            // 执行添加操作
//            hrmService.addFy(fy);
//            // 设置客户端跳转到查询请求
//            mv.setViewName("redirect:/fy/selectFy");
//        }
        mv.setViewName("fy/showExamineFy");
        // 返回
        return mv;
    }


    /**
     * 处理修改非遗请求
     *
     * @param String       flag 标记， 1表示跳转到修改页面，2表示执行修改操作
     * @param Fy           fy 要修改非遗的对象
     * @param ModelAndView mv
     */
    @RequestMapping(value = "/fy/updateFy")
    public ModelAndView updateFy(
            String flag,
            @ModelAttribute Fy fy,
            ModelAndView mv) {
        if (flag.equals("1")) {
            // 根据id查询非遗
            Fy target = hrmService.findFyById(fy.getId());
            // 设置Model数据
            mv.addObject("fy", target);
            // 设置跳转到修改页面
            mv.setViewName("fy/showUpdateFy");
        } else {
            // 执行修改操作
            hrmService.modifyFy(fy);
            // 设置客户端跳转到查询请求
            mv.setViewName("redirect:/fy/selectFy");
        }
        // 返回
        return mv;
    }

}
