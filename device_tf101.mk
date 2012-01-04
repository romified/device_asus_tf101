$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/tf101/tf101-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/tf101/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/asus/tf101/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := cm_tf101
PRODUCT_DEVICE := tf101

PRODUCT_CHARACTERISTICS := tablet

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        persist.sys.usb.config=mtp

include frameworks/base/build/tablet-dalvik-heap.mk

PRODUCT_COPY_FILES += \
	device/asus/tf101/init.ventana.rc:root/init.ventana.rc \
	device/asus/tf101/ueventd.ventana.rc:root/ueventd.ventana.rc \
	device/asus/tf101/media_profiles.xml:system/etc/media_profiles.xml \
	device/asus/tf101/gps.conf:system/etc/gps.conf \
	device/asus/tf101/bcm4329.ko:system/lib/modules/bcm4329.ko \
	device/asus/tf101/battery_rvsd.ko:system/lib/modules/battery_rvsd.ko \
	device/asus/tf101/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
	device/asus/tf101/asound.conf:system/etc/asound.conf \
	device/asus/tf101/nvram.txt:system/etc/nvram.txt \
	device/asus/tf101/nvram_a.txt:system/etc/nvram_a.txt 

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/asus/tf101/asus.hardware.TF101.xml:system/etc/permissions/asus.hardware.TF101.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
	
PRODUCT_COPY_FILES += \
    device/asus/tf101/EM820W_11.810.09.12.00.zip:system/etc/firmware/EM820W_11.810.09.12.00.zip \
    device/asus/tf101/FU.cfg:system/etc/firmware/EC/FU.cfg \
    device/asus/tf101/FU-d.cfg:system/etc/firmware/EC/FU-d.cfg \
    device/asus/tf101/TF101-EC-0213.rom:system/etc/firmware/EC/TF101-EC-0213.rom

PRODUCT_COPY_FILES += \
        device/asus/tf101/vold.fstab:system/etc/vold.fstab \
        device/asus/tf101/eGalax_Serial.idc:system/usr/idc/eGalax_Serial.idc \
		device/asus/tf101/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
		device/asus/tf101/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
		device/asus/tf101/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
        device/asus/tf101/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
        device/asus/tf101/asusec.kl:system/usr/keylayout/asusec.kl \
        device/asus/tf101/asusec.kcm:system/usr/keychars/asusec.kcm	
	
PRODUCT_PACKAGES += \
	lights.tf101 \
	sensors.tf101 \
	audio.tf101 \
    hwcomposer.default \
    sensors.default \
	librs_jni \
	com.android.future.usb.accessory \
	make_ext4fs \
	setup_fs \
    gralloc.tegra \
	sensors.tegra

WIFI_BAND := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \
