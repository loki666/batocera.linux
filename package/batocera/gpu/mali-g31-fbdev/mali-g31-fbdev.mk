################################################################################
#
# mali mp400 gbm
#
################################################################################
# Version.: Commits on Feb 24, 2022

MALI_G31_FBDEV_VERSION = 240222
MALI_G31_FBDEV_SOURCE = rg35xx-plus_libmali_$(MALI_G31_FBDEV_VERSION).tar.gz
MALI_G31_FBDEV_SITE = https://github.com/loki666/rg35xx-plus-packages/releases/download/20240222

MALI_G31_FBDEV_INSTALL_STAGING = YES
MALI_G31_FBDEV_PROVIDES = libegl libgles libmali

define MALI_G31_FBDEV_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/lib

	$(INSTALL) -D -m 0755 $(@D)/libmali.so.0.20.0       $(STAGING_DIR)/usr/lib/libmali.so.0.20.0

	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libmali.so.0
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libmali.so
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libGLESv2.so.2.1.0
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libGLESv2.so.2
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libGLESv2.so
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libGLESv1_CM.so.1.1.0
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libGLESv1_CM.so.1
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libGLESv1_CM.so
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libEGL.so.1.4.0
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libEGL.so.1
	ln -sfr $(STAGING_DIR)/usr/lib/libmali.so.0.20.0     $(STAGING_DIR)/usr/lib/libEGL.so

    cp -rf $(@D)/include/* $(STAGING_DIR)/usr/include/

	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(INSTALL) -D -m 0644  $(@D)/egl.pc     $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
	$(INSTALL) -D -m 0644  $(@D)/glesv2.pc  $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
endef

define MALI_G31_FBDEV_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib
	
	$(INSTALL) -D -m 0755 $(@D)/libmali.so.0.20.0           $(TARGET_DIR)/usr/lib/libmali.so.0.20.0
	ln -sfr $(TARGET_DIR)/usr/lib/libmali.so.0.20.0         $(TARGET_DIR)/usr/lib/libmali.so.0
	ln -sfr $(TARGET_DIR)/usr/lib/libmali.so.0              $(TARGET_DIR)/usr/lib/libmali.so

	$(INSTALL) -D -m 0755 $(@D)/libGLESv2.so.2.1.0          $(TARGET_DIR)/usr/lib/libGLESv2.so.2.1.0
	ln -sfr $(TARGET_DIR)/usr/lib/libGLESv2.so.2.1.0        $(TARGET_DIR)/usr/lib/libGLESv2.so.2
	ln -sfr $(TARGET_DIR)/usr/lib/libGLESv2.so.2            $(TARGET_DIR)/usr/lib/libGLESv2.so

	$(INSTALL) -D -m 0755 $(@D)/libGLESv1_CM.so.1.1.0       $(TARGET_DIR)/usr/lib/libGLESv1_CM.so.1.1.0
	ln -sfr $(TARGET_DIR)/usr/lib/libGLESv1_CM.so.1.1.0     $(TARGET_DIR)/usr/lib/libGLESv1_CM.so.1
	ln -sfr $(TARGET_DIR)/usr/lib/libGLESv1_CM.so.1         $(TARGET_DIR)/usr/lib/libGLESv1_CM.so

	$(INSTALL) -D -m 0755 $(@D)/libEGL.so.1.4.0             $(TARGET_DIR)/usr/lib/libEGL.so.1.4.0
	ln -sfr $(TARGET_DIR)/usr/lib/libEGL.so.1.4.0           $(TARGET_DIR)/usr/lib/libEGL.so.1
	ln -sfr $(TARGET_DIR)/usr/lib/libEGL.so.1               $(TARGET_DIR)/usr/lib/libEGL.so

endef

$(eval $(generic-package))
