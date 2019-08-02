TOP = ../..
include $(TOP)/configure/CONFIG

include $(GSL)/gsl_flags.mak

LIBRARY_IOC += gslSupport
DBD += gsl.dbd

gslSupport_LIBS += $(EPICS_BASE_IOC_LIBS)
gslSupport_LIBS += gsl
gslSupport_SRCS += line_of_best_fit.c


include $(TOP)/configure/RULES

