TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = gsl_epics_test

gsl_epics_test_SRCS += gsl_epics_test.c
gsl_epics_test_LIBS += gsl
gsl_epics_test_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/gsl_flags.mak

include $(TOP)/configure/RULES

