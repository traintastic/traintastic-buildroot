################################################################################
#
# traintastic-server
#
################################################################################

TRAINTASTIC_SERVER_VERSION = origin/master
TRAINTASTIC_SERVER_SITE = https://github.com/traintastic/traintastic.git
TRAINTASTIC_SERVER_SITE_METHOD = git
TRAINTASTIC_SERVER_GIT_SUBMODULES = YES
TRAINTASTIC_SERVER_CONF_OPTS = -DINSTALL_TRANSLATIONS=ON -DNO_LOCALHOST_ONLY_SETTING=ON
TRAINTASTIC_SERVER_SUBDIR = server
TRAINTASTIC_SERVER_INSTALL_STAGING = NO
TRAINTASTIC_SERVER_INSTALL_TARGET = YES

define TRAINTASTIC_SERVER_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_TRAINTASTIC_PATH)/package/traintastic-server/S90traintastic-server $(TARGET_DIR)/etc/init.d/S90traintastic-server
endef

define TRAINTASTIC_SERVER_USERS
	traintastic-server -1 traintastic -1 * - - - Traintastic-server daemon
endef

define TRAINTASTIC_SERVER_PERMISSIONS
	/var/opt/traintastic d 0755 traintastic-server traintastic - - - - -
endef

$(eval $(cmake-package))
