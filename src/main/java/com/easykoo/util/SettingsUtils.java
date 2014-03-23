package com.easykoo.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.*;
import java.util.Properties;


/**
 * @author Jesse
 * @version 03/23/2014
 */
public class SettingsUtils {
    private Log logger = LogFactory.getLog(getClass());

    private static String _configPath = ConfigUtils.getInstance().getConfig("settings.properties.path");
    private static SettingsUtils _instance = null;
    private Properties properties = new Properties();

    private SettingsUtils() {
        try {
            InputStream inputStream = new FileInputStream(_configPath);
            properties.load(inputStream);
            if (inputStream != null)
                inputStream.close();
        } catch (Exception e) {
            logger.error(_configPath + " not found or wrong format!");
        }
    }

    public static SettingsUtils getInstance() {
        if (_instance == null) {
            _instance = new SettingsUtils();
        }
        return _instance;
    }

    public SettingsUtils clone() {
        return getInstance();
    }

    public String getConfig(String key) {
        return properties.getProperty(key);
    }

    public void setValue(String key, String value) {
        try {
            OutputStream fos = new FileOutputStream(new File(_configPath));
            properties.setProperty(key, value);
            properties.store(fos, "Update '" + key + "' to '" + value + "'");
            logger.debug("Update '" + key + "' to '" + value + "' successfully!");
            fos.close();
        } catch (IOException e) {
            logger.error("Update '" + key + "' to '" + value + "' failed!");
        }
    }
}