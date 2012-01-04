# Release name
PRODUCT_RELEASE_NAME := Transformer

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/asus/tf101/full_tf101.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := tf101
PRODUCT_NAME := cm_tf101
PRODUCT_BRAND := Asus
PRODUCT_MODEL := Transformer

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=tf101 BUILD_ID=HTK75D BUILD_DISPLAY_ID=HTK75D BUILD_FINGERPRINT="asus/transformer/tf101:4.0.33/HTK75D/190830:user/release-keys" PRIVATE_BUILD_DESC="transformer-user 4.0.3 HTK75D 190830 release-keys"
