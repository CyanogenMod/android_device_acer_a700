package com.cyanogenmod.settings.device;

import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.PreferenceActivity;

public class DeviceSettings extends PreferenceActivity  {

    public static final String KEY_TOUCH_SENSITIVITY = "touch_sensitivity_raw";
    public static final String KEY_POWER_MODE = "power_mode";

    private ListPreference mTouchSensitivity;
    private ListPreference mPowerMode;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mTouchSensitivity = (ListPreference) findPreference(KEY_TOUCH_SENSITIVITY);
        mTouchSensitivity.setEnabled(TouchSensitivity.isSupported());
        mTouchSensitivity.setOnPreferenceChangeListener(new TouchSensitivity());

        mPowerMode = (ListPreference) findPreference(KEY_POWER_MODE);
        mPowerMode.setEnabled(PowerMode.isSupported());
        mPowerMode.setOnPreferenceChangeListener(new PowerMode());
    }

}
