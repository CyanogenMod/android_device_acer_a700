package com.cyanogenmod.settings.device;

import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.PreferenceActivity;

public class DeviceSettings extends PreferenceActivity  {

    public static final String KEY_TOUCH_SENSITIVITY = "touch_sensitivity";

    private ListPreference mTouchSensitivity;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mTouchSensitivity = (ListPreference) findPreference(KEY_TOUCH_SENSITIVITY);
        mTouchSensitivity.setEnabled(TouchSensitivity.isSupported());
        mTouchSensitivity.setOnPreferenceChangeListener(new TouchSensitivity());
    }

}
