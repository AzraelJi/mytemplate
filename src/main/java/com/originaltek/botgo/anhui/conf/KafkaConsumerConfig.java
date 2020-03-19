package com.originaltek.botgo.anhui.conf;

import com.originaltek.botgo.anhui.listener.XunFeiKafkaListener;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.config.KafkaListenerContainerFactory;
import org.springframework.kafka.core.ConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.listener.ConcurrentMessageListenerContainer;

import java.util.HashMap;
import java.util.Map;

/**
 * @author yangyangyang
 * @since 2019/9/26
 **/
@Configuration
@EnableKafka
public class KafkaConsumerConfig {

    @Value("${kafka.default-group-id}")
    private String defaultGroupId;

    @Value("${kafka.url}")
    private String kafkaUrl;

    @Bean
    @Primary
    public KafkaListenerContainerFactory<ConcurrentMessageListenerContainer<Integer, String>> kafkaListenerContainerFactory() {
        ConcurrentKafkaListenerContainerFactory<Integer, String> factory =
                new ConcurrentKafkaListenerContainerFactory<>();
        factory.setConcurrency(1);
        factory.getContainerProperties().setPollTimeout(3000);
        factory.setConsumerFactory(consumerFactory());
        factory.setBatchListener(true);
        //      factory.getContainerProperties().setAckMode(RECORD);
        return factory;
    }

    @Bean
    public ConsumerFactory<Integer, String> consumerFactory() {
        return new DefaultKafkaConsumerFactory<>(consumerConfigs());
    }


    private Map<String, Object> consumerConfigs() {
        Map<String, Object> propsMap = new HashMap<>(12);
        propsMap.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, kafkaUrl);
        propsMap.put(ConsumerConfig.GROUP_ID_CONFIG, defaultGroupId);
//        propsMap.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        propsMap.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "latest");
        propsMap.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, false);
        propsMap.put(ConsumerConfig.AUTO_COMMIT_INTERVAL_MS_CONFIG, "6000");
        propsMap.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, 500);
        propsMap.put(ConsumerConfig.SESSION_TIMEOUT_MS_CONFIG, "15000");
        propsMap.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        propsMap.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        return propsMap;
    }

}
