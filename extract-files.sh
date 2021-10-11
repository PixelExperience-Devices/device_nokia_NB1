#!/bin/bash
#
# Copyright (C) 2018-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=NB1
VENDOR=nokia

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

LINEAGE_ROOT="${MY_DIR}"/../../..

HELPER="${LINEAGE_ROOT}"/tools/extract-utils/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

SECTION=
KANG=

if [ $# -eq 0 ]; then
  SRC_COMMON=adb
  SRC_DEVICE=adb
else
  if [ $# -eq 2 ]; then
    SRC_COMMON=${1}
    SRC_DEVICE=${2}
  else
    echo "${0}: Bad number of arguments"
    echo ""
    echo "Usage: ./extract-files.sh common_dump device_dump"
    exit 1
  fi
fi

function blob_fixup() {
    case "${1}" in
        ## NB1 Patches
        # Patch gx_fpd for VNDK support
        vendor/bin/gx_fpd)
            "${PATCHELF}" --remove-needed "libunwind.so" "${2}" 
            "${PATCHELF}" --remove-needed "libbacktrace.so" "${2}"
            "${PATCHELF}" --add-needed "liblog.so" "${2}"
            "${PATCHELF}" --add-needed "libshim_binder.so" "${2}"
            ;;
        # Hexedit gxfingerprint to load goodix firmware from /vendor/firmware/
        vendor/lib64/hw/gxfingerprint.default.so)
            sed -i -e 's|/system/etc/firmware|/vendor/firmware\x0\x0\x0\x0|g' "${2}"
            ;;
        system_ext/etc/permissions/qti_fingerprint_interface.xml)
            sed -i -e 's|/system/framework|/system/system_ext/framework|g' "${2}"
            ;;
        # Use vendor version of libgui
        vendor/lib/hw/camera.msm8998.so)
            "${PATCHELF}" --replace-needed "libgui.so" "libgui_vendor.so" "${2}"
            "${PATCHELF}" --add-needed "libshim_gui.so" "${2}"
            ;;
        # Shim libdpmframework
        product/lib64/libdpmframework.so)
            "${PATCHELF}" --add-needed "libshim_cutils.so" "${2}"
            ;;
        # Convert sdm660 to msm8998
        vendor/lib/hw/vulkan.msm8998.so|vendor/lib64/hw/vulkan.msm8998.so)
            "${PATCHELF}" --set-soname "vulkan.msm8998.so" "${2}"
            ;;
        # Health
        vendor/bin/hw/android.hardware.health@2.0-service)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v30.so" "${2}"
            ;;
    esac
}

# Initialize the helper for common device
setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}" true "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC_COMMON}" "${KANG}" --section "${SECTION}"
extract "${MY_DIR}/proprietary-files-nb1.txt" "${SRC_DEVICE}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
