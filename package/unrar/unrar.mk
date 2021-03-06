################################################################################
#
# unrar
#
################################################################################

UNRAR_VERSION = 5.3.9
UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
UNRAR_SITE = http://www.rarlab.com/rar
UNRAR_LICENSE = unrar
UNRAR_LICENSE_FILES = license.txt

define UNRAR_BUILD_CMDS
	$(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread" \
		LDFLAGS="$(TARGET_LDFLAGS) -pthread" -C $(@D)
endef

define UNRAR_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
endef

$(eval $(generic-package))
