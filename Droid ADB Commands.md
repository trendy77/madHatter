#android adb COMMANDS

- LIST APK APP PACKAGES
````
adb shell pm list packages [options] <FILTER>
````
***adb shell pm list packages***
<!-- pagebreak -->
adb shell pm list packages -f See their associated file.
<!-- pagebreak -->
adb shell pm list packages -d Filter to only show disabled packages.
<!-- pagebreak -->
adb shell pm list packages -e Filter to only show enabled packages.
<!-- pagebreak -->
adb shell pm list packages -s Filter to only show system packages.
<!-- pagebreak -->
adb shell pm list packages -3 Filter to only show third party packages.
<!-- pagebreak -->
adb shell pm list packages -i See the installer for the packages.
<!-- pagebreak -->
adb shell pm list packages -u Also include uninstalled packages.
<!-- pagebreak -->
adb shell pm list packages --user <USER_ID> The user space to query.



````
adb shell pm path <PACKAGE>
````
adb shell pm path com.android.phone

## getprop properties

getprop [options]

````
adb shell
````
