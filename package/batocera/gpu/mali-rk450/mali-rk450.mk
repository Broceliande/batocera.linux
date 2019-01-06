################################################################################
#
# mali-rk450
#
################################################################################

MALI_RK450_VERSION = 3d777c26fc4ee005c0b92b388b8874e1e77b134b
MALI_RK450_SITE = $(call github,ayufan-rock64,libmali,$(MALI_RK450_VERSION))

MALI_RK450_INSTALL_STAGING = YES
MALI_RK450_PROVIDES = libegl libgles

MALI_RK450_TARGET_DIR=$(TARGET_DIR)
MALI_RK450_STAGING_DIR=$(STAGING_DIR)

define MALI_RK450_INSTALL_STAGING_CMDS
	mkdir -p $(MALI_RK450_STAGING_DIR)
	ifeq ($(BR2_arm),y)
	  cp -r $(@D)/lib/arm-linux-gnueabihf/libmali-midgard-t86x-r14p0-gbm.so $(MALI_RK450_STAGING_DIR)/usr/lib
	else
	  cp -r $(@D)/lib/aarch64-linux-gnu/libmali-midgard-t86x-r14p0-gbm.so $(MALI_RK450_STAGING_DIR)/usr/lib
	endif
	(cd $(MALI_RK450_STAGING_DIR)/usr/lib && ln -sf libmali-midgard-t86x-r14p0-gbm.so libmali.so)

	(cd $(MALI_RK450_STAGING_DIR)/usr/lib && ln -sf libmali.so libEGL.so)
	(cd $(MALI_RK450_STAGING_DIR)/usr/lib && ln -sf libmali.so libEGL.so.1)
	(cd $(MALI_RK450_STAGING_DIR)/usr/lib && ln -sf libmali.so libgbm.so)
	(cd $(MALI_RK450_STAGING_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so)
	(cd $(MALI_RK450_STAGING_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so.2)
	(cd $(MALI_RK450_STAGING_DIR)/usr/lib && ln -sf libmali.so libMali.so)

	cp -pr $(@D)/include $(MALI_RK450_STAGING_DIR)/usr
endef

define MALI_RK450_INSTALL_TARGET_CMDS
	mkdir -p $(MALI_RK450_TARGET_DIR)
	ifeq ($(BR2_arm),y)
	  cp -r $(@D)/lib/arm-linux-gnueabihf/libmali-midgard-t86x-r14p0-gbm.so $(MALI_RK450_TARGET_DIR)/usr/lib
        else
	  cp -r $(@D)/lib/aarch64-linux-gnu/libmali-midgard-t86x-r14p0-gbm.so $(MALI_RK450_TARGET_DIR)/usr/lib
	endif
	(cd $(MALI_RK450_TARGET_DIR)/usr/lib && ln -sf libmali-midgard-t86x-r14p0-gbm.so libmali.so)

	(cd $(MALI_RK450_TARGET_DIR)/usr/lib && ln -sf libmali.so libEGL.so)
	(cd $(MALI_RK450_TARGET_DIR)/usr/lib && ln -sf libmali.so libEGL.so.1)
	(cd $(MALI_RK450_TARGET_DIR)/usr/lib && ln -sf libmali.so libgbm.so)
	(cd $(MALI_RK450_TARGET_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so)
	(cd $(MALI_RK450_TARGET_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so.2)
	(cd $(MALI_RK450_TARGET_DIR)/usr/lib && ln -sf libmali.so libMali.so)
endef

$(eval $(generic-package))
