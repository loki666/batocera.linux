RG35XX_PLUS_TOOLBOX_VERSION = 4de9ae9b823577ec999303bf1334ae38d1426b5b # git hash
RG35XX_PLUS_TOOLBOX_SITE = $(call github,loki666,rg35xx-plus-toolbox,$(RG35XX_PLUS_TOOLBOX_VERSION))

# Install steps
define RG35XX_PLUS_TOOLBOX_INSTALL_TARGET_CMDS
    $(INSTALL) -D \
        $(@D)/target/$(RUSTC_TARGET_NAME)/release/rg35xx-plus-toolbox \
        $(TARGET_DIR)/usr/bin/
endef

$(eval $(cargo-package))