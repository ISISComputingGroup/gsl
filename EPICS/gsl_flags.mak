##
## include this in an EPICS Makefile to set correct compiler flags for static/DLL linking on Windows
##
USR_CPPFLAGS_WIN32 += -DWIN32
ifeq ($(findstring static,$(EPICS_HOST_ARCH)),)
USR_CPPFLAGS_WIN32 += -DGSL_DLL
endif
