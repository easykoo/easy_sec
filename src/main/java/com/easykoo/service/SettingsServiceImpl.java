package com.easykoo.service;

import com.easykoo.model.Settings;
import com.easykoo.util.SettingsUtils;
import org.springframework.stereotype.Service;

/**
 * Created by Jesse on 14-3-23.
 */
@Service("settingsService")
public class SettingsServiceImpl implements ISettingsService {

    @Override
    public Settings getSettings() {
        Settings settings = new Settings();
        String keywords = SettingsUtils.getInstance().getConfig("settings.keywords");
        settings.setKeywords(keywords);
        String description = SettingsUtils.getInstance().getConfig("settings.description");
        settings.setDescription(description);
        return settings;
    }

    @Override
    public void updateSettings(Settings record) {
        SettingsUtils.getInstance().setValue("settings.keywords", record.getKeywords());
        SettingsUtils.getInstance().setValue("settings.description", record.getDescription());
    }
}
