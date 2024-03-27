RG35XX_PLUS_TOOLBOX_VERSION = 3b9e0b19d4dc1c6f8e6cd49a6dab8e49c20cef4f # git hash
RG35XX_PLUS_TOOLBOX_SITE = $(call github,loki666,rg35xx-plus-toolbox,$(RG35XX_PLUS_TOOLBOX_VERSION))

# Install steps
define RG35XX_PLUS_TOOLBOX_INSTALL_TARGET_CMDS
    $(INSTALL) -D \
        $(@D)/target/$(RUSTC_TARGET_NAME)/release/rg35xx-plus-toolbox \
        $(TARGET_DIR)/usr/bin/
endef

$(eval $(cargo-package))