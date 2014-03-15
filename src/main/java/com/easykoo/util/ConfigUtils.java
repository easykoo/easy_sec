package com.easykoo.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.InputStream;
import java.util.Properties;


/**
 * @author Jesse
 * @version 03/12/2014
 */
public class ConfigUtils {
    private Log logger = LogFactory.getLog(getClass());

    private static ConfigUtils _instance = null;
    private Properties properties = new Properties();

    private ConfigUtils() {
        try {
            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("config.properties");
            properties.load(inputStream);
            if (inputStream != null)
                inputStream.close();
        } catch (Exception e) {
            logger.error("config.properties not found or wrong format");
        }
    }

    public static ConfigUtils getInstance() {
        if (_instance == null) {
            _instance = new ConfigUtils();
        }
        return _instance;
    }

    public ConfigUtils clone() {
        return getInstance();
    }

    public String getConfig(String key) {
        return properties.getProperty(key);
    }

    public String[] getNoNeedFilterUrl() {
        String arrayStr = properties.getProperty("no.need.filter");
        String[] array = arrayStr.split(",");
        return array;
    }

    public String[] getNoNeedLoginUrl() {
        String arrayStr = properties.getProperty("no.need.login");
        String[] array = arrayStr.split(",");
        return array;
    }

    public String getProductDirectory() {
        return properties.getProperty("product.directory");
    }

    public String getPictureSizeLimit() {
        return properties.getProperty("picture.limit.size");
    }
}