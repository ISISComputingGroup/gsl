USR_CPPFLAGS += -DWIN32
ifeq ($(findstring static,$(EPICS_HOST_ARCH)),)
USR_CPPFLAGS += -DGSL_DLL
endif
