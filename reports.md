# Reports

For every release, some tests from [Post-Install](https://dortania.github.io/OpenCore-Post-Install/)
are performed.

## [Universal: Fixing Audio](https://dortania.github.io/OpenCore-Post-Install/universal/audio.html)

Run command `kextstat | grep -E "AppleHDA|AppleALC|Lilu"`, 3 of them showed up.

![Fixing audio screenshot.](https://github.com/hendraanggrian/OpenCore-Gigabyte-B460M-Aorus-Pro/raw/assets/reports/universal_audio.png)

## [Universal: Fixing DRM](https://dortania.github.io/OpenCore-Post-Install/universal/drm.html)

Run executable [VDADecoderChecker](https://i.applelife.ru/2019/05/451893_10.12_VDADecoderChecker.zip),
hardware acceleration is confirmed.
To fix error `VDADecoderCreate failed. err: -12473`, force the AMD Decoder:

```sh
defaults write com.apple.AppleGVA gvaForceAMDAVCDecode -boolean yes
```

![Fixing DRM screenshot.](https://github.com/hendraanggrian/OpenCore-Gigabyte-B460M-Aorus-Pro/raw/assets/reports/universal_drm.png)

## [Universal: Fixing Power Management](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html)

Run application [IORegistryExplorer](https://github.com/khronokernel/IORegistryClone/blob/master/ioreg-302.zip),
`PR00` indicates that XCPM is present.

![Fixing power management screenshot.](https://github.com/hendraanggrian/OpenCore-Gigabyte-B460M-Aorus-Pro/raw/assets/reports/universal_pm.png)

## [Miscellaneous: Emulated NVRAM](https://dortania.github.io/OpenCore-Post-Install/misc/nvram.html)

Run `sudo nvram myvar="$(date)"` and later `nvram myvar` after reboot,
value stored to NVRAM is sucessfully retrieved.

![Fixing NVRAM screenshot.](https://github.com/hendraanggrian/OpenCore-Gigabyte-B460M-Aorus-Pro/raw/assets/reports/misc_nvram.png)
