################################################################################
#
# firmware-rg35xx-plus
#
################################################################################
# Version.: Commits on Jun 2, 2023

FIRMWARE_RG35XX_PLUS_VERSION = 240222
FIRMWARE_RG35XX_PLUS_SOURCE = rg35xx-plus_firmware_$(FIRMWARE_RG35XX_PLUS_VERSION).tar.gz
FIRMWARE_RG35XX_PLUS_SITE = https://github.com/loki666/rg35xx-plus-packages/releases/download/20240222

FIRMWARE_RG35XX_PLUS_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_RG35XX_PLUS_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_RG35XX_PLUS_TARGET_DIR)
	cp -a $(@D)/* $(FIRMWARE_RG35XX_PLUS_TARGET_DIR)/
endef

$(eval $(generic-package))
