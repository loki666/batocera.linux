################################################################################
#
# rg35xx-plus-modules
#
################################################################################
# Version.: Commits on Jun 2, 2023

RG35XX_PLUS_MODULES_VERSION = 240222
RG35XX_PLUS_MODULES_SOURCE = rg35xx-plus_modules_$(RG35XX_PLUS_MODULES_VERSION).tar.gz
RG35XX_PLUS_MODULES_SITE = https://github.com/loki666/rg35xx-plus-packages/releases/download/20240222

RG35XX_PLUS_MODULES_TARGET_DIR=$(TARGET_DIR)/lib/modules/

define RG35XX_PLUS_MODULES_INSTALL_TARGET_CMDS
	mkdir -p $(RG35XX_PLUS_MODULES_TARGET_DIR)
	cp -a $(@D)/* $(RG35XX_PLUS_MODULES_TARGET_DIR)/
endef

$(eval $(generic-package))
