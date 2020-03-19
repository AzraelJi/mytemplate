package com.originaltek.botgo.anhui.controller;

import com.originaltek.botgo.anhui.service.PushDataToOriginalKafka;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@CrossOrigin
@RequestMapping("/test")
@Slf4j
public class TestController {

    @Resource
    private PushDataToOriginalKafka pushDataToOriginalKafka;

    @GetMapping("/push")
    public String testPush(){
        pushDataToOriginalKafka.pushData();
        return "true";
    }
}
