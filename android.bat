adb shell settings put global overlay_display_devices 2560x1600/227

set /p id="Display ID: "

adb shell ime set com.wparam.nullkeyboard/.NullKeyboard

scrcpy --bit-rate 16M  --stay-awake --turn-screen-off --disable-screensaver  --prefer-text --display %id%

adb shell ime set com.iflytek.inputmethod/.FlyIME

adb shell settings put global overlay_display_devices none

