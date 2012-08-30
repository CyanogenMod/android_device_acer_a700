/*
 * Copyright (C) 2011 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef A1026_H
#define A1026_H

enum A1026_TableID {
	A1026_TABLE_VOIP_INTMIC,
	A1026_TABLE_VOIP_EXTMIC,
	A1026_TABLE_30CM_CAMCORDER_INTMIC, // Narrative
	A1026_TABLE_30CM_CAMCORDER_INTMIC_REAR, // Normal
	A1026_TABLE_CAMCORDER_EXTMIC,
	A1026_TABLE_30CM_ASR_INTMIC,
	A1026_TABLE_ASR_EXTMIC,
	A1026_TABLE_STEREO_CAMCORDER,
	A1026_TABLE_3M_CAMCORDER_INTMIC, // Concert
	A1026_TABLE_3M_CAMCORDER_INTMIC_REAR, // Class
	A1026_TABLE_3M_ASR_INTMIC,
	A1026_TABLE_SOUNDHOUND_INTMIC,
	A1026_TABLE_SOUNDHOUND_EXTMIC,
	A1026_TABLE_ES305_PLAYBACK,
	A1026_TABLE_CTS,
	A1026_TABLE_HDMI_VOIP,
	A1026_TABLE_SUSPEND = 99
};

void a1026_init();
int a1026_set_config(enum A1026_TableID mode);

#endif