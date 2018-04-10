export JAVA_PATH=$JAVA_HOME
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_HOME="$HOME/Library/Android/sdk/ndk-bundle"
export PATH=$JAVA_PATH:$ANDROID_HOME:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_NDK_HOME:$PATH
export PATH=`pwd`../flutter/bin:$PATH

launchctl setenv ANDROID_NDK_HOME $ANDROID_NDK_HOME

launchctl setenv ANDROID_FD_SIGNING_PROPERTIES "none"
