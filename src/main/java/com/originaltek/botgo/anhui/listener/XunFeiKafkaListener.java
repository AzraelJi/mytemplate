package com.originaltek.botgo.anhui.listener;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class XunFeiKafkaListener {

    @Resource
    private KafkaTemplate kafkaTemplate;

//    @KafkaListener(id = "coms", topics = "test", groupId = "group1")
//    public void listen1(ConsumerRecord<?, ?> record) {
//        System.out.println("topic：" + record.topic());
//        System.out.println("key:" + record.key());
//        System.out.println("value:" + record.value());
//    }

    @KafkaListener(id = "originaltek1", topics = "TRAFFIC_ACCIDENT_TOPIC", groupId = "group1")
    public void listen1(String data) {
        System.out.println("TRAFFIC_ACCIDENT_TOPIC----------" + data);
        kafkaTemplate.send("ahgs_test", data);
    }

    @KafkaListener(id = "originaltek2", topics = "WHOLE_ROAD_CONDITIONT_TOPIC", groupId = "group2")
    public void listen2(String data) {
        System.out.println("WHOLE_ROAD_CONDITIONT_TOPIC----------" + data);
        kafkaTemplate.send("ahgs_test", data);
    }

    @KafkaListener(id = "originaltek3", topics = "OTHER_ROAD_CONDITIONS_TOPIC", groupId = "group3")
    public void listen3(String data) {
        System.out.println("OTHER_ROAD_CONDITIONS_TOPIC----------" + data);
        kafkaTemplate.send("ahgs_test", data);
    }

    @KafkaListener(id = "originaltek4", topics = "ROAD_CONSTRUCTION_TOPIC", groupId = "group4")
    public void listen4(String data) {
        System.out.println("ROAD_CONSTRUCTION_TOPIC----------" + data);
        kafkaTemplate.send("ahgs_test", data);
    }

    @KafkaListener(id = "originaltek5", topics = "TRAFFIC_CONTROL_TOPIC", groupId = "group5")
    public void listen5(String data) {
        System.out.println("TRAFFIC_CONTROL_TOPIC----------" + data);
        kafkaTemplate.send("ahgs_test", data);
    }
}
