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
        String tel = SettingsUtils.getInstance().getConfig("settings.tel");
        settings.setTel(tel);
        String fax = SettingsUtils.getInstance().getConfig("settings.fax");
        settings.setFax(fax);
        String email = SettingsUtils.getInstance().getConfig("settings.email");
        settings.setEmail(email);
        String twitter = SettingsUtils.getInstance().getConfig("settings.twitter");
        settings.setTwitter(twitter);
        String skype = SettingsUtils.getInstance().getConfig("settings.skype");
        settings.setSkype(skype);
        String facebook = SettingsUtils.getInstance().getConfig("settings.facebook");
        settings.setFacebook(facebook);
        String address = SettingsUtils.getInstance().getConfig("settings.address");
        settings.setAddress(address);
        String cnAddress = SettingsUtils.getInstance().getConfig("settings.cn.address");
        settings.setCnAddress(cnAddress);
        String keywords = SettingsUtils.getInstance().getConfig("settings.keywords");
        settings.setKeywords(keywords);
        String description = SettingsUtils.getInstance().getConfig("settings.description");
        settings.setDescription(description);
        return settings;
    }

    @Override
    public void updateSettings(Settings record) {
        SettingsUtils.getInstance().setValue("settings.tel", record.getTel());
        SettingsUtils.getInstance().setValue("settings.fax", record.getFax());
        SettingsUtils.getInstance().setValue("settings.email", record.getEmail());
        SettingsUtils.getInstance().setValue("settings.twitter", record.getTwitter());
        SettingsUtils.getInstance().setValue("settings.skype", record.getSkype());
        SettingsUtils.getInstance().setValue("settings.facebook", record.getFacebook());
        SettingsUtils.getInstance().setValue("settings.address", record.getAddress());
        SettingsUtils.getInstance().setValue("settings.cn.address", record.getCnAddress());
        SettingsUtils.getInstance().setValue("settings.keywords", record.getKeywords());
        SettingsUtils.getInstance().setValue("settings.description", record.getDescription());
    }
}
