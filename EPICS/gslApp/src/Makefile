TOP = ../..
include $(TOP)/configure/CONFIG

# extract visual studio major version number from path
# unfortunately cannot use %.% so using %.0 but may not match minor version number changes e.g. 10.1
ifneq ($(VisualStudioVersion),)
VS_VERS=$(filter %.0,$(subst \, ,$(VisualStudioVersion)))
else
VS_VERS=$(filter %.0,$(subst \, ,$(VSINSTALLDIR)))
endif
VS_MAJOR=$(word 1,$(subst ., ,$(VS_VERS)))

CMAKE ?= cmake

GSL_INSTALL=$(TOP)/install/$(EPICS_HOST_ARCH)
#CMAKE_CONFIG_FLAGS=-DBOOST_ROOT:STRING=$(EPICS_ROOT)/libraries/master/boost -DGSL_INSTALL_MULTI_CONFIG=ON
CMAKE_BUILD_FLAGS=
ifneq ($(findstring linux,$(EPICS_HOST_ARCH)),)
CMAKE_GENERATOR=Unix Makefiles
else
ifneq ($(findstring windows,$(EPICS_HOST_ARCH)),)
VS_ARCH=$(VS_MAJOR) Win64
PLATFORM=x64
else
VS_ARCH=$(VS_MAJOR)
PLATFORM=Win32
endif
CMAKE_GENERATOR=Visual Studio $(VS_ARCH)
ifeq ($(findstring static,$(EPICS_HOST_ARCH)),)
CMAKE_CONFIG_FLAGS += -DBUILD_SHARED_LIBS=ON -DMSVC_RUNTIME_DYNAMIC=ON 
endif
endif
ifneq ($(findstring debug,$(EPICS_HOST_ARCH)),)
CMAKE_CONFIG_FLAGS += -DCMAKE_BUILD_TYPE:STRING=Debug
CMAKE_CONFIG=Debug
else
CMAKE_CONFIG=RelWithDebInfo
endif

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

ifdef T_A
install:
	$(CMAKE) $(GSL) -G "$(CMAKE_GENERATOR)" -DCMAKE_INSTALL_PREFIX:PATH="$(GSL_INSTALL)" $(CMAKE_CONFIG_FLAGS)
	$(CMAKE) --build . --target install --config $(CMAKE_CONFIG) $(CMAKE_BUILD_FLAGS)
	-$(MKDIR) $(GSL)/bin
	-$(MKDIR) $(GSL)/bin/$(EPICS_HOST_ARCH)
	-$(MKDIR) $(GSL)/lib
	-$(MKDIR) $(GSL)/lib/$(EPICS_HOST_ARCH)
	-$(MKDIR) $(GSL)/include
	-$(MKDIR) $(GSL)/include/gsl
	$(CP) -f $(GSL_INSTALL)/include/gsl/*.h* $(GSL)/include/gsl/
ifeq ($(findstring linux,$(EPICS_HOST_ARCH)),)
	$(CP) -f $(GSL_INSTALL)/bin/*.dll $(GSL)/bin/$(EPICS_HOST_ARCH)/
	$(CP) -f $(GSL_INSTALL)/lib/*.lib $(GSL)/lib/$(EPICS_HOST_ARCH)/
else
	$(CP) -f $(GSL_INSTALL)/lib/*.a $(GSL)/lib/$(EPICS_HOST_ARCH)/
endif
endif

#clean::
#	$(MAKE) -C mysql-connector-c -f Makefile.epics clean T_A=$(T_A) CMAKE_CONFIG=$(CMAKE_CONFIG) PLATFORM=$(PLATFORM) MYSQL_DIR="$(MYSQL_DIR)"
#	$(MAKE) -C mysql-connector-c++ -f Makefile.epics clean T_A=$(T_A) CMAKE_CONFIG=$(CMAKE_CONFIG) PLATFORM=$(PLATFORM) MYSQL_DIR="$(MYSQL_DIR)"
#
#uninstall:
#	$(RMDIR) $(MYSQL_DIR)
#
