DSONAME = nvFlexDop_$(HOUDINI_MAJOR_RELEASE)$(HOUDINI_MINOR_RELEASE).so
SOURCES = $(addprefix $(PWD)/, $(shell echo nvFlexDop/*.cpp))
CC = $(CXX)

INSTDIR = $(PWD)/package/NvFlexDop/dso/linux64/Release_$(HOUDINI_MAJOR_RELEASE)$(HOUDINI_MINOR_RELEASE)
INCDIRS = -I$(NVFLEX_DIR)/include
LIBDIRS = -L$(NVFLEX_DIR)/lib/linux64 
LIBS = $(NVFLEX_DIR)/lib/linux64/NvFlexReleaseCUDA_x64.a $(NVFLEX_DIR)/lib/linux64/NvFlexDeviceRelease_x64.a $(NVFLEX_DIR)/lib/linux64/NvFlexExtReleaseCUDA_x64.a -lcuda -lcudart_static

include $(HFS)/toolkit/makefiles/Makefile.gnu

