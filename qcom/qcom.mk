# Copyright 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),deb)

include $(CLEAR_VARS)
LOCAL_MODULE := libacdbloader
LOCAL_SRC_FILES := libacdbloader.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := qcom

# Create symbolic link because user space can access persist directory,
# while kernel ALSA drivers can only access the /system/etc/firmware directory
LOCAL_POST_INSTALL_CMD := \
    mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9310; \
        ln -sf /data/misc/audio/wcd9310_anc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_anc.bin; \
        ln -sf /data/misc/audio/mbhc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_mbhc.bin

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := tzapps.mdt
LOCAL_MODULE_OWNER := qcom
LOCAL_SRC_FILES := tzapps.mdt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware
LOCAL_POST_INSTALL_CMD := \
        mkdir -p $(TARGET_OUT)/etc/firmware/; \
        ln -sf /system/vendor/firmware/tzapps.b00 $(TARGET_OUT)/etc/firmware/tzapps.b00; \
        ln -sf /system/vendor/firmware/tzapps.b01 $(TARGET_OUT)/etc/firmware/tzapps.b01; \
        ln -sf /system/vendor/firmware/tzapps.b02 $(TARGET_OUT)/etc/firmware/tzapps.b02; \
        ln -sf /system/vendor/firmware/tzapps.b03 $(TARGET_OUT)/etc/firmware/tzapps.b03; \
        ln -sf /system/vendor/firmware/tzapps.mdt $(TARGET_OUT)/etc/firmware/tzapps.mdt;
include $(BUILD_PREBUILT)

endif

# Qualcomm blob(s) necessary for Deb hardware
PRODUCT_COPY_FILES := \
    vendor/asus/deb/proprietary/qcom/ATFWD-daemon:system/bin/ATFWD-daemon:qcom \
    vendor/asus/deb/proprietary/qcom/bridgemgrd:system/bin/bridgemgrd:qcom \
    vendor/asus/deb/proprietary/qcom/btnvtool:system/bin/btnvtool:qcom \
    vendor/asus/deb/proprietary/qcom/diag_klog:system/bin/diag_klog:qcom \
    vendor/asus/deb/proprietary/qcom/diag_mdlog:system/bin/diag_mdlog:qcom \
    vendor/asus/deb/proprietary/qcom/ds_fmc_appd:system/bin/ds_fmc_appd:qcom \
    vendor/asus/deb/proprietary/qcom/efsks:system/bin/efsks:qcom \
    vendor/asus/deb/proprietary/qcom/hci_qcomm_init:system/bin/hci_qcomm_init:qcom \
    vendor/asus/deb/proprietary/qcom/irsc_util:system/bin/irsc_util:qcom \
    vendor/asus/deb/proprietary/qcom/ks:system/bin/ks:qcom \
    vendor/asus/deb/proprietary/qcom/mm-qcamera-app:system/bin/mm-qcamera-app:qcom \
    vendor/asus/deb/proprietary/qcom/mm-qcamera-daemon:system/bin/mm-qcamera-daemon:qcom \
    vendor/asus/deb/proprietary/qcom/mm-qjpeg-enc-test:system/bin/mm-qjpeg-enc-test:qcom \
    vendor/asus/deb/proprietary/qcom/mm-qomx-ienc-test:system/bin/mm-qomx-ienc-test:qcom \
    vendor/asus/deb/proprietary/qcom/mpdecision:system/bin/mpdecision:qcom \
    vendor/asus/deb/proprietary/qcom/netmgrd:system/bin/netmgrd:qcom \
    vendor/asus/deb/proprietary/qcom/nl_listener:system/bin/nl_listener:qcom \
    vendor/asus/deb/proprietary/qcom/port-bridge:system/bin/port-bridge:qcom \
    vendor/asus/deb/proprietary/qcom/qcks:system/bin/qcks:qcom \
    vendor/asus/deb/proprietary/qcom/qmuxd:system/bin/qmuxd:qcom \
    vendor/asus/deb/proprietary/qcom/qseecomd:system/bin/qseecomd:qcom \
    vendor/asus/deb/proprietary/qcom/radish:system/bin/radish:qcom \
    vendor/asus/deb/proprietary/qcom/rmt_storage:system/bin/rmt_storage:qcom \
    vendor/asus/deb/proprietary/qcom/sensors.qcom:system/bin/sensors.qcom:qcom \
    vendor/asus/deb/proprietary/qcom/thermald:system/bin/thermald:qcom \
    vendor/asus/deb/proprietary/qcom/usbhub:system/bin/usbhub:qcom \
    vendor/asus/deb/proprietary/qcom/usbhub_init:system/bin/usbhub_init:qcom \
    vendor/asus/deb/proprietary/qcom/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw:qcom \
    vendor/asus/deb/proprietary/qcom/vidc.b00:system/etc/firmware/vidc.b00:qcom \
    vendor/asus/deb/proprietary/qcom/vidc.b01:system/etc/firmware/vidc.b01:qcom \
    vendor/asus/deb/proprietary/qcom/vidc.b02:system/etc/firmware/vidc.b02:qcom \
    vendor/asus/deb/proprietary/qcom/vidc.b03:system/etc/firmware/vidc.b03:qcom \
    vendor/asus/deb/proprietary/qcom/vidcfw.elf:system/etc/firmware/vidcfw.elf:qcom \
    vendor/asus/deb/proprietary/qcom/vidc.mdt:system/etc/firmware/vidc.mdt:qcom \
    vendor/asus/deb/proprietary/qcom/gps.conf:system/etc/gps.conf:qcom \
    vendor/asus/deb/proprietary/qcom/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so:qcom \
    vendor/asus/deb/proprietary/qcom/libEGL_adreno.so:system/lib/egl/libEGL_adreno.so:qcom \
    vendor/asus/deb/proprietary/qcom/libGLESv1_CM_adreno.so:system/lib/egl/libGLESv1_CM_adreno.so:qcom \
    vendor/asus/deb/proprietary/qcom/libGLESv2_adreno.so:system/lib/egl/libGLESv2_adreno.so:qcom \
    vendor/asus/deb/proprietary/qcom/libplayback_adreno.so:system/lib/egl/libplayback_adreno.so:qcom \
    vendor/asus/deb/proprietary/qcom/libq3dtools_adreno.so:system/lib/egl/libq3dtools_adreno.so:qcom \
    vendor/asus/deb/proprietary/qcom/flp.msm8960.so:system/lib/hw/flp.msm8960.so:qcom \
    vendor/asus/deb/proprietary/qcom/gps.msm8960.so:system/lib/hw/gps.msm8960.so:qcom \
    vendor/asus/deb/proprietary/qcom/sensors.msm8960.so:system/lib/hw/sensors.msm8960.so:qcom \
    vendor/asus/deb/proprietary/qcom/libadreno_utils.so:system/lib/libadreno_utils.so:qcom \
    vendor/asus/deb/proprietary/qcom/libaudcal.so:system/lib/libaudcal.so:qcom \
    vendor/asus/deb/proprietary/qcom/libaudioalsa.so:system/lib/libaudioalsa.so:qcom \
    vendor/asus/deb/proprietary/qcom/libC2D2.so:system/lib/libC2D2.so:qcom \
    vendor/asus/deb/proprietary/qcom/libc2d30-a3xx.so:system/lib/libc2d30-a3xx.so:qcom \
    vendor/asus/deb/proprietary/qcom/libc2d30.so:system/lib/libc2d30.so:qcom \
    vendor/asus/deb/proprietary/qcom/libCB.so:system/lib/libCB.so:qcom \
    vendor/asus/deb/proprietary/qcom/libchromatix_ov5693_common.so:system/lib/libchromatix_ov5693_common.so:qcom \
    vendor/asus/deb/proprietary/qcom/libchromatix_ov5693_default_video.so:system/lib/libchromatix_ov5693_default_video.so:qcom \
    vendor/asus/deb/proprietary/qcom/libchromatix_ov5693_preview.so:system/lib/libchromatix_ov5693_preview.so:qcom \
    vendor/asus/deb/proprietary/qcom/libCommandSvc.so:system/lib/libCommandSvc.so:qcom \
    vendor/asus/deb/proprietary/qcom/libconfigdb.so:system/lib/libconfigdb.so:qcom \
    vendor/asus/deb/proprietary/qcom/libcsd-client.so:system/lib/libcsd-client.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdiag.so:system/lib/libdiag.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdrmdiag.so:system/lib/libdrmdiag.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdrmfs.so:system/lib/libdrmfs.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdrmtime.so:system/lib/libdrmtime.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdsi_netctrl.so:system/lib/libdsi_netctrl.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdsprofile.so:system/lib/libdsprofile.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdss.so:system/lib/libdss.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdsucsd.so:system/lib/libdsucsd.so:qcom \
    vendor/asus/deb/proprietary/qcom/libdsutils.so:system/lib/libdsutils.so:qcom \
    vendor/asus/deb/proprietary/qcom/libDxHdcp.so:system/lib/libDxHdcp.so:qcom \
    vendor/asus/deb/proprietary/qcom/libgps.utils.so:system/lib/libgps.utils.so:qcom \
    vendor/asus/deb/proprietary/qcom/libgsl.so:system/lib/libgsl.so:qcom \
    vendor/asus/deb/proprietary/qcom/libI420colorconvert.so:system/lib/libI420colorconvert.so:qcom \
    vendor/asus/deb/proprietary/qcom/libidl.so:system/lib/libidl.so:qcom \
    vendor/asus/deb/proprietary/qcom/libllvm-a3xx.so:system/lib/libllvm-a3xx.so:qcom \
    vendor/asus/deb/proprietary/qcom/libloc_core.so:system/lib/libloc_core.so:qcom \
    vendor/asus/deb/proprietary/qcom/libloc_eng.so:system/lib/libloc_eng.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmm-abl.so:system/lib/libmm-abl.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_stats_algorithm.so:system/lib/libmmcamera2_stats_algorithm.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera_image_stab.so:system/lib/libmmcamera_image_stab.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera_mi1040.so:system/lib/libmmcamera_mi1040.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera_ov5693.so:system/lib/libmmcamera_ov5693.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmm-color-convertor.so:system/lib/libmm-color-convertor.so:qcom \
    vendor/asus/deb/proprietary/qcom/libnetmgr.so:system/lib/libnetmgr.so:qcom \
    vendor/asus/deb/proprietary/qcom/liboemcrypto.so:system/lib/liboemcrypto.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqcci_legacy.so:system/lib/libqcci_legacy.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqdi.so:system/lib/libqdi.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqdp.so:system/lib/libqdp.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmi_cci.so:system/lib/libqmi_cci.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmi_client_qmux.so:system/lib/libqmi_client_qmux.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmi_common_so.so:system/lib/libqmi_common_so.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmi_csi.so:system/lib/libqmi_csi.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmi_csvt_srvc.so:system/lib/libqmi_csvt_srvc.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmi_encdec.so:system/lib/libqmi_encdec.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmiservices.so:system/lib/libqmiservices.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqmi.so:system/lib/libqmi.so:qcom \
    vendor/asus/deb/proprietary/qcom/libQSEEComAPI.so:system/lib/libQSEEComAPI.so:qcom \
    vendor/asus/deb/proprietary/qcom/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so:qcom \
    vendor/asus/deb/proprietary/qcom/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so:qcom \
    vendor/asus/deb/proprietary/qcom/librs_adreno_sha1.so:system/lib/librs_adreno_sha1.so:qcom \
    vendor/asus/deb/proprietary/qcom/librs_adreno.so:system/lib/librs_adreno.so:qcom \
    vendor/asus/deb/proprietary/qcom/libRSDriver_adreno.so:system/lib/libRSDriver_adreno.so:qcom \
    vendor/asus/deb/proprietary/qcom/libsc-a3xx.so:system/lib/libsc-a3xx.so:qcom \
    vendor/asus/deb/proprietary/qcom/libsensor1.so:system/lib/libsensor1.so:qcom \
    vendor/asus/deb/proprietary/qcom/libsensor_reg.so:system/lib/libsensor_reg.so:qcom \
    vendor/asus/deb/proprietary/qcom/libsensor_user_cal.so:system/lib/libsensor_user_cal.so:qcom \
    vendor/asus/deb/proprietary/qcom/libstagefright_hdcp.so:system/lib/libstagefright_hdcp.so:qcom \
    vendor/asus/deb/proprietary/qcom/libxml.so:system/lib/libxml.so:qcom \
    vendor/asus/deb/proprietary/qcom/a300_pfp.fw:system/vendor/firmware/a300_pfp.fw:qcom \
    vendor/asus/deb/proprietary/qcom/a300_pm4.fw:system/vendor/firmware/a300_pm4.fw:qcom \
    vendor/asus/deb/proprietary/qcom/dxhdcp2.b00:system/vendor/firmware/discretix/dxhdcp2.b00:qcom \
    vendor/asus/deb/proprietary/qcom/dxhdcp2.b01:system/vendor/firmware/discretix/dxhdcp2.b01:qcom \
    vendor/asus/deb/proprietary/qcom/dxhdcp2.b02:system/vendor/firmware/discretix/dxhdcp2.b02:qcom \
    vendor/asus/deb/proprietary/qcom/dxhdcp2.b03:system/vendor/firmware/discretix/dxhdcp2.b03:qcom \
    vendor/asus/deb/proprietary/qcom/dxhdcp2.mdt:system/vendor/firmware/discretix/dxhdcp2.mdt:qcom \
    vendor/asus/deb/proprietary/qcom/dsps.b00:system/vendor/firmware/dsps.b00:qcom \
    vendor/asus/deb/proprietary/qcom/dsps.b01:system/vendor/firmware/dsps.b01:qcom \
    vendor/asus/deb/proprietary/qcom/dsps.b02:system/vendor/firmware/dsps.b02:qcom \
    vendor/asus/deb/proprietary/qcom/dsps.b03:system/vendor/firmware/dsps.b03:qcom \
    vendor/asus/deb/proprietary/qcom/dsps.b04:system/vendor/firmware/dsps.b04:qcom \
    vendor/asus/deb/proprietary/qcom/dsps.b05:system/vendor/firmware/dsps.b05:qcom \
    vendor/asus/deb/proprietary/qcom/dsps.mdt:system/vendor/firmware/dsps.mdt:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b00:system/vendor/firmware/gss.b00:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b01:system/vendor/firmware/gss.b01:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b02:system/vendor/firmware/gss.b02:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b03:system/vendor/firmware/gss.b03:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b04:system/vendor/firmware/gss.b04:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b05:system/vendor/firmware/gss.b05:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b06:system/vendor/firmware/gss.b06:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b07:system/vendor/firmware/gss.b07:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b08:system/vendor/firmware/gss.b08:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b09:system/vendor/firmware/gss.b09:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b10:system/vendor/firmware/gss.b10:qcom \
    vendor/asus/deb/proprietary/qcom/gss.b11:system/vendor/firmware/gss.b11:qcom \
    vendor/asus/deb/proprietary/qcom/gss.mdt:system/vendor/firmware/gss.mdt:qcom \
    vendor/asus/deb/proprietary/qcom/keymaster.b00:system/vendor/firmware/keymaster/keymaster.b00:qcom \
    vendor/asus/deb/proprietary/qcom/keymaster.b01:system/vendor/firmware/keymaster/keymaster.b01:qcom \
    vendor/asus/deb/proprietary/qcom/keymaster.b02:system/vendor/firmware/keymaster/keymaster.b02:qcom \
    vendor/asus/deb/proprietary/qcom/keymaster.b03:system/vendor/firmware/keymaster/keymaster.b03:qcom \
    vendor/asus/deb/proprietary/qcom/keymaster.mdt:system/vendor/firmware/keymaster/keymaster.mdt:qcom \
    vendor/asus/deb/proprietary/qcom/q6.b00:system/vendor/firmware/q6.b00:qcom \
    vendor/asus/deb/proprietary/qcom/q6.b01:system/vendor/firmware/q6.b01:qcom \
    vendor/asus/deb/proprietary/qcom/q6.b03:system/vendor/firmware/q6.b03:qcom \
    vendor/asus/deb/proprietary/qcom/q6.b04:system/vendor/firmware/q6.b04:qcom \
    vendor/asus/deb/proprietary/qcom/q6.b05:system/vendor/firmware/q6.b05:qcom \
    vendor/asus/deb/proprietary/qcom/q6.b06:system/vendor/firmware/q6.b06:qcom \
    vendor/asus/deb/proprietary/qcom/q6.mdt:system/vendor/firmware/q6.mdt:qcom \
    vendor/asus/deb/proprietary/qcom/tzapps.b00:system/vendor/firmware/tzapps.b00:qcom \
    vendor/asus/deb/proprietary/qcom/tzapps.b01:system/vendor/firmware/tzapps.b01:qcom \
    vendor/asus/deb/proprietary/qcom/tzapps.b02:system/vendor/firmware/tzapps.b02:qcom \
    vendor/asus/deb/proprietary/qcom/tzapps.b03:system/vendor/firmware/tzapps.b03:qcom \
    vendor/asus/deb/proprietary/qcom/wcnss.b00:system/vendor/firmware/wcnss.b00:qcom \
    vendor/asus/deb/proprietary/qcom/wcnss.b01:system/vendor/firmware/wcnss.b01:qcom \
    vendor/asus/deb/proprietary/qcom/wcnss.b02:system/vendor/firmware/wcnss.b02:qcom \
    vendor/asus/deb/proprietary/qcom/wcnss.b04:system/vendor/firmware/wcnss.b04:qcom \
    vendor/asus/deb/proprietary/qcom/wcnss.b05:system/vendor/firmware/wcnss.b05:qcom \
    vendor/asus/deb/proprietary/qcom/wcnss.mdt:system/vendor/firmware/wcnss.mdt:qcom \
    vendor/asus/deb/proprietary/qcom/libdrmdecrypt.so:system/vendor/lib/libdrmdecrypt.so:qcom \
    vendor/asus/deb/proprietary/qcom/libgemini.so:system/vendor/lib/libgemini.so:qcom \
    vendor/asus/deb/proprietary/qcom/libgeofence.so:system/vendor/lib/libgeofence.so:qcom \
    vendor/asus/deb/proprietary/qcom/libimage-jpeg-enc-omx-comp.so:system/vendor/lib/libimage-jpeg-enc-omx-comp.so:qcom \
    vendor/asus/deb/proprietary/qcom/libimage-omx-common.so:system/vendor/lib/libimage-omx-common.so:qcom \
    vendor/asus/deb/proprietary/qcom/libizat_core.so:system/vendor/lib/libizat_core.so:qcom \
    vendor/asus/deb/proprietary/qcom/libloc_api_v02.so:system/vendor/lib/libloc_api_v02.so:qcom \
    vendor/asus/deb/proprietary/qcom/libloc_ds_api.so:system/vendor/lib/libloc_ds_api.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_c2d_module.so:system/vendor/lib/libmmcamera2_c2d_module.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_cpp_module.so:system/vendor/lib/libmmcamera2_cpp_module.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_iface_modules.so:system/vendor/lib/libmmcamera2_iface_modules.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_imglib_modules.so:system/vendor/lib/libmmcamera2_imglib_modules.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_isp_modules.so:system/vendor/lib/libmmcamera2_isp_modules.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_pproc_modules.so:system/vendor/lib/libmmcamera2_pproc_modules.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_sensor_modules.so:system/vendor/lib/libmmcamera2_sensor_modules.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_stats_modules.so:system/vendor/lib/libmmcamera2_stats_modules.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_vpe_module.so:system/vendor/lib/libmmcamera2_vpe_module.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera2_wnr_module.so:system/vendor/lib/libmmcamera2_wnr_module.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera_faceproc.so:system/vendor/lib/libmmcamera_faceproc.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmcamera_imglib.so:system/vendor/lib/libmmcamera_imglib.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmipl.so:system/vendor/lib/libmmipl.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmjpeg.so:system/vendor/lib/libmmjpeg.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmqjpeg_codec.so:system/vendor/lib/libmmqjpeg_codec.so:qcom \
    vendor/asus/deb/proprietary/qcom/libmmstillomx.so:system/vendor/lib/libmmstillomx.so:qcom \
    vendor/asus/deb/proprietary/qcom/liboemcamera.so:system/vendor/lib/liboemcamera.so:qcom \
    vendor/asus/deb/proprietary/qcom/libqomx_jpegenc.so:system/vendor/lib/libqomx_jpegenc.so:qcom

PRODUCT_PACKAGES := libacdbloader tzapps.mdt
