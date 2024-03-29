RG35XX_PLUS_TOOLBOX_VERSION = 08359c7e00bedd7f60c33009a904a39a7cf8577f # git hash
RG35XX_PLUS_TOOLBOX_SITE = $(call github,loki666,rg35xx-plus-toolbox,$(RG35XX_PLUS_TOOLBOX_VERSION))

# Install steps
define RG35XX_PLUS_TOOLBOX_INSTALL_TARGET_CMDS
    $(INSTALL) -D \
        $(@D)/target/$(RUSTC_TARGET_NAME)/release/rg35xx-plus-toolbox \
        $(TARGET_DIR)/usr/bin/
endef

$(eval $(cargo-package))