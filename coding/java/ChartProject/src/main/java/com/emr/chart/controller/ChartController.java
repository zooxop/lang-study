package com.emr.chart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChartController {
    Logger log = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/chart/login.do")
    public ModelAndView login() throws Exception {
        // ModelAndView mv = new ModelAndView("/chart/login");
        ModelAndView mv = new ModelAndView("/login");

        return mv;
    }
}
