package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class TouchSensitivity implements OnPreferenceChangeListener {

    private static final String FILE = "/sys/Touch/sensitivity_raw";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        Utils.writeValue(FILE, sharedPrefs.getString(DeviceSettings.KEY_TOUCH_SENSITIVITY, "70"));
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Utils.writeValue(FILE, (String) newValue);

        // Update summary
        ListPreference lp = (ListPreference) preference;
        int index = lp.findIndexOfValue((String) newValue);
        preference.setSummary(lp.getEntries()[index]);
        return true;
    }

}
