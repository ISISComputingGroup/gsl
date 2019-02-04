USR_CPPFLAGS_WIN32 += -DWIN32
ifeq ($(findstring static,$(EPICS_HOST_ARCH)),)
USR_CPPFLAGS_WIN32 += -DGSL_DLL
endif
