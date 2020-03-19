package com.originaltek.botgo.anhui.service.impl;

import com.originaltek.botgo.anhui.service.PushDataToOriginalKafka;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@Slf4j
public class PushDataToOriginalKafkaImpl implements PushDataToOriginalKafka {

    @Resource
    private KafkaTemplate kafkaTemplate;

    @Override
    public void pushData() {
        for (; ; ) {
            kafkaTemplate.send("test", "发送test");
            break;
        }
    }
}
