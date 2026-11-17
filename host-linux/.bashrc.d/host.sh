# Linux workstation (x86_64, i3/X11)

# Android SDK
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# HiDPI under X11: X has no compositor scaling, so scale GTK apps directly
export GDK_SCALE=2
export GDK_DPI_SCALE=1
