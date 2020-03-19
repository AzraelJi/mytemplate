package com.originaltek.botgo.anhui.conf;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.p6spy.engine.spy.appender.MessageFormattingStrategy;

/**
 * <p>P6SpyLoggerFormatter sql日志格式化</p>
 *
 * @author wwzz
 * @since 2019/10/13
 */
public class P6SpyLoggerFormatter implements MessageFormattingStrategy {

    @Override
    public String formatMessage(int connectionId, String now, long elapsed, String category,
                                String prepared, String sql, String url) {
        return StringUtils.isNotEmpty(sql) ? "Execute SQL：" + sql.replaceAll("[\\s]+", " ") : null;
    }

}
