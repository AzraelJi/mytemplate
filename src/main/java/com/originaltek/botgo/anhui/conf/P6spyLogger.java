package com.originaltek.botgo.anhui.conf;

import java.lang.management.ManagementFactory;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

/**
 * <p>P6spyLogger 日志打印</p>
 *
 * @author wwzz
 * @since 2019/10/13
 */
public class P6spyLogger extends com.p6spy.engine.spy.appender.StdoutLogger {

    private final static DateTimeFormatter logDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS", Locale.CHINA);
    private final static int processId = Integer.parseInt(ManagementFactory.getRuntimeMXBean().getName().split("@")[0]);

    @Override
    public void logText(String text) {
        if (text != null)
            System.err.println(String.format("%s  INFO %d --- [           sql] %s", LocalDateTime.now().format(logDateFormatter), processId, text));
    }

}
