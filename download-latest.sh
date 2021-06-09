#!/bin/bash

# Search for the latest version with GitHub Releases API and download accordingly.
downloadRelease() {
    local owner=$1
    local repo=$2
    local filename=$3
    local version=$(curl https://api.github.com/repos/$owner/$repo/releases/latest | ./jq-osx-amd64 '.name' | tr -d '"')
    local file=$filename-$version-RELEASE

    curl -OL https://github.com/$owner/$repo/releases/download/$version/$file.zip
    unzip $file.zip -d $file
    rm -rf $file.zip
}

# For repos without releases, download its source instead.
downloadArchive() {
    local owner=$1
    local repo=$2

    curl -L http://github.com/$owner/$repo/archive/master.zip -o $repo.zip
    unzip $repo.zip -d $repo
    rm -rf $repo.zip
}

# Download single raw file.
downloadRaw() {
    local owner=$1
    local repo=$2
    local path=$3

    curl -OL https://raw.githubusercontent.com/$owner/$repo/$path
}

# OpenCore
downloadRelease acidanthera OpenCorePkg OpenCore
downloadArchive acidanthera OcBinaryData

# Kexts
downloadRelease acidanthera Lilu Lilu
downloadRelease acidanthera VirtualSMC VirtualSMC
downloadRelease acidanthera WhateverGreen WhateverGreen
downloadRelease acidanthera AppleALC AppleALC
downloadRelease acidanthera IntelMausi IntelMausi
downloadRelease acidanthera NVMeFix NVMeFix

# SSDT
downloadRaw dortania Getting-Started-With-ACPI master/extra-files/compiled/SSDT-AWAC.aml
downloadRaw dortania Getting-Started-With-ACPI master/extra-files/compiled/SSDT-EC-USBX-DESKTOP.aml
downloadRaw dortania Getting-Started-With-ACPI master/extra-files/compiled/SSDT-PLUG-DRTNIA.aml