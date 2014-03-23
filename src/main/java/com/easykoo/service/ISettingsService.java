package com.easykoo.service;

import com.easykoo.model.Settings;

/**
 * Mar 23, 2014    Steven
 */
public interface ISettingsService {
    public Settings getSettings();

    public void updateSettings(Settings record);
}
