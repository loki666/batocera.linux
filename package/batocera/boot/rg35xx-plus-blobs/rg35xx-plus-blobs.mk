################################################################################
#
# rg35xx-plus-blobs
#
################################################################################
# Version.: Commits on Jun 2, 2023

RG35XX_PLUS_BLOBS_VERSION = 1.0
RG35XX_PLUS_BLOBS_SOURCE = rg35xx-plus-blobs.tar.gz
RG35XX_PLUS_BLOBS_SITE = https://github.com/loki666/rg35xx-plus-blobs/releases/download/$(RG35XX_PLUS_BLOBS_VERSION)

define RG35XX_PLUS_BLOBS_INSTALL_TARGET_CMDS
	cp $(@D)/boot.img             $(BINARIES_DIR)/boot.img 
	cp $(@D)/boot0.img            $(BINARIES_DIR)/boot0.img
	cp $(@D)/boot_package.fex     $(BINARIES_DIR)/boot_package.fex
	cp $(@D)/env.img              $(BINARIES_DIR)/env.img
endef

$(eval $(generic-package))
