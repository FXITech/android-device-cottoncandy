/*
** Copyright 2008, The Android Open-Source Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

#ifndef ANDROID_AUDIO_CODEC_H
#define ANDROID_AUDIO_CODEC_H

namespace android_audio_legacy {

typedef struct AudioMixer_tag {
    const char *ctl;
    const int   val;
} AudioMixer;

//  codec mixer settings
//  : These settings depend on your sound codec driver.
//  : You have to modify.
//
const AudioMixer device_out_SPK[] = {
    {NULL, NULL}
};
const AudioMixer device_out_RCV[] = {
    {NULL, NULL}
};
const AudioMixer device_out_RING_SPK[] = {
    {NULL, NULL}
};
const AudioMixer device_out_RING_NO_MIC[] = {
    {NULL, NULL}
};
const AudioMixer device_out_HP_NO_MIC[] = {
    {NULL, NULL}
};
const AudioMixer device_out_RING_HP[] = {
    {NULL, NULL}
};
const AudioMixer device_out_HP[] = {
    {NULL, NULL}
};
const AudioMixer device_out_RING_SPK_HP[] = {
    {NULL, NULL}
};
const AudioMixer device_out_SPK_HP[] = {
    {NULL, NULL}
};
const AudioMixer device_out_BT[] = {
    {NULL, NULL}
};
const AudioMixer device_out_OFF[] = {
    {NULL, NULL}
};

const AudioMixer device_voice_RCV[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_SPK[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_TTY_VCO[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_TTY_HCO[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_TTY_FULL[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_HP_NO_MIC[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_HP[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_BT[] = {
    {NULL, NULL}
};
const AudioMixer device_voice_OFF[] = {
    {NULL, NULL}
};

const AudioMixer device_input_Main_Mic[] = {
    {NULL, NULL}
};
const AudioMixer device_input_Hands_Free_Mic[] = {
    {NULL, NULL}
};
const AudioMixer device_input_BT_Sco_Mic[] = {
    {NULL, NULL}
};
const AudioMixer device_input_MIC_OFF[] = {
    {NULL, NULL}
};

}; // namespace android

#endif //ANDROID_AUDIO_CODEC_H
