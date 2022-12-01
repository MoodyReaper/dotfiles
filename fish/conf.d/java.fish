# Run only on login
if status --is-login
    # https://wiki.archlinux.org/title/Java#Switching_between_JVM
    # https://wiki.archlinux.org/title/android#Java_Development_Kit
    set -gx JAVA_HOME /usr/lib/jvm/default

    # https://wiki.archlinux.org/title/Java_Runtime_Environment_fonts
    # https://wiki.archlinux.org/title/java#Illegible_fonts
    # https://wiki.archlinux.org/title/java#Better_font_rendering
    # set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

    # https://wiki.archlinux.org/title/android#Android_Studio
    set -gx ANDROID_HOME ~/Programming/Android/SDK
end
