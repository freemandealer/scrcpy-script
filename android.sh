#!/bin/bash
# Controller: install scrcpy & adb, ref https://github.com/Genymobile/scrcpy/blob/master/README.zh-Hans.md

set -x

function onExit() {
    echo "exiting"
    adb shell ime set com.iflytek.inputmethod/.FlyIME
    adb shell settings put global overlay_display_devices none
}

trap 'onExit' 2

adb shell settings put global overlay_display_devices 2560x1600/227

displayNum=$(adb shell dumpsys display | grep mDisplayId  | tail -n 1 | cut -d "=" -f2)

adb shell ime set com.wparam.nullkeyboard/.NullKeyboard

isTargetIME=$(adb shell settings get secure default_input_method | grep Null | wc -l)
if [ $isTargetIME -eq 1 ]
then
    echo "set IME to null"
    scrcpy --bit-rate 16M  --stay-awake --turn-screen-off --disable-screensaver  --prefer-text --display ${displayNum}
else
    echo "failed to set IME to null"
fi

onExit

