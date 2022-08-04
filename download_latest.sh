#!/bin/bash

if ! command -v jq &> /dev/null; then
  echo 'jq is not installed'
  exit 1
fi

pull_kext() {
  local name=$1
  local version=$(get_github_latest_release_version 'acidanthera' "$name")
  local file="$name-$version-RELEASE"
  download_github_release 'acidanthera' "$name" "$version" "$file.zip"
  extract "$file"

  mkdir -p 'Kexts'
  for f in $(find "$file/" -name '*.kext'); do
    mv "$f" 'Kexts'
  done
  rm -r "$file"
}

pull_ssdt() {
  local name=$1
  download_github_raw 'dortania' 'Getting-Started-With-ACPI' 'master' "extra-files/compiled/$name.aml"

  mkdir -p 'ACPI'
  mv "$name.aml" 'ACPI'
}

get_github_latest_release_version() {
  local owner=$1
  local repo=$2
  curl "https://api.github.com/repos/$owner/$repo/releases/latest" | jq '.name' | tr -d '"'
}

download_github_release() {
  local owner=$1
  local repo=$2
  local version=$3
  local file=$4
  curl -OL "https://github.com/$owner/$repo/releases/download/$version/$file"
}

download_github_archive() {
  local owner=$1
  local repo=$2
  local branch=$3
  curl -L "http://github.com/$owner/$repo/archive/$branch.zip" -o "$repo.zip"
}

download_github_raw() {
  local owner=$1
  local repo=$2
  local branch=$3
  local path=$4
  curl -OL "https://raw.githubusercontent.com/$owner/$repo/$branch/$path"
}

extract() {
  local file=$1
  unzip "$file.zip" -d "$file"
  rm -rf "$file.zip"
}

oc_version=$(get_github_latest_release_version 'acidanthera' 'OpenCorePkg')
oc_file="OpenCore-$oc_version-RELEASE"
download_github_release 'acidanthera' 'OpenCorePkg' "$oc_version" "$oc_file.zip"
extract "$oc_file"

download_github_archive 'acidanthera' 'OcBinaryData' 'master'
extract 'OcBinaryData'

pull_ssdt 'SSDT-AWAC'
pull_ssdt 'SSDT-EC-USBX-DESKTOP'
pull_ssdt 'SSDT-PLUG-DRTNIA'

pull_kext 'Lilu'
pull_kext 'VirtualSMC'
pull_kext 'WhateverGreen'
pull_kext 'AppleALC'
pull_kext 'IntelMausi'
pull_kext 'NVMeFix'
pull_kext 'BrcmPatchRAM'
