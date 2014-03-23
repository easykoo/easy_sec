package com.easykoo.service;

import com.easykoo.model.Settings;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Feb 22, 2014    Steven
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class SettingsServiceTest {
    private Log logger = LogFactory.getLog(getClass());
    private ISettingsService settingsService;

    public ISettingsService getSettingsService() {
        return settingsService;
    }

    @Autowired
    public void setSettingsService(ISettingsService settingsService) {
        this.settingsService = settingsService;
    }

    @Test
    public void testGetSettings() {
        Settings settings = settingsService.getSettings();
        logger.debug(settings.getKeywords());
        logger.debug(settings.getDescription());
    }

    @Test
    public void testUpdateSettings() {
        Settings settings = new Settings();
        settings.setKeywords("good111,kids");
        settings.setDescription("good111 desc");
        settingsService.updateSettings(settings);
    }
}
