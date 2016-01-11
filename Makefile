########################################################################
#                          -*- Makefile -*-                            #
########################################################################
## Flags

## Compiler and addional compiler Flags
FC  =  gfortran
CXX =  g++
CC  =  gcc
FCFLAGS  = -g
CXXFLAGS = -g
CFLAGS   = -g

# recommended compiler flags
REC_FCFLAGS   = -fno-automatic -fno-range-check
REC_FCFLAGS  += -ffixed-line-length-none -lgfortran -ff2c -DU77EXT=0 -DQuad=0
REC_FCFLAGS  += $(FCFLAGS)
REC_CXXFLAGS  = -fomit-frame-pointer -ffast-math -Wall -m64
REC_CXXFLAGS += $(CXFLAGS)
REC_CFLAGS    = -fomit-frame-pointer -ffast-math -Wall -m64
REC_CFLAGS   += -DNOUNDERSCORE=0 -DBIGENDIAN=0
REC_CFLAGS   += $(CFLAGS)

UNAME = $(shell uname)
ifeq ($(UNAME), Darwin)
  #Mac OSX
  REC_CFLAGS   += -stdlib=libstdc++ -mmacosx-version-min=10.6 -Qunused-arguments
  REC_CXXFLAGS += -stdlib=libstdc++ -mmacosx-version-min=10.6 -Qunused-arguments
endif

## warning for type-conversions -> basically useless, as those occur in
## too many places
#WARN  = -Wconversion -Wall -Wtabs -Wall -Wimplicit-interface
## -fbounds-check sometimes causes a weird error due to non-lazy
## evaluation of boolean in gfortran.
#WARN += -fbounds-check
## gfortran 4.4.1 optimized with -O3 yields erroneous results
## Use -O2 to be on the safe side
OPT = -O2

########################################################################
## Paths

WORKINGDIR = $(shell pwd)

# directories
TOOLS   = $(WORKINGDIR)/Tools
LT     = $(TOOLS)/LoopTools-2.12
SLHA   = $(TOOLS)/SLHALib-2.2
DHELAS = $(TOOLS)/DHELAS

ALL_FCFLAGS  = $(REC_FCFLAGS) $(OPT) $(WARN)

libs: libdhelas3.a liblooptools.a libSLHA.a print-info

libdhelas3.a:
	cd $(DHELAS) && make FC="$(FC)" F77="$(FC)" XFFLAGS="$(ALL_FCFLAGS)"
	
liblooptools.a:
	cd $(LT) && make FC="$(FC)" F77="$(FC)" FFLAGS="$(ALL_FCFLAGS)" CXXFLAGS="$(REC_CXXFLAGS)" CFLAGS="$(REC_CFLAGS)"

libSLHA.a:
	cd $(SLHA) && make FC="$(FC)" F77="$(FC)" FFLAGS="$(ALL_FCFLAGS)" CXXFLAGS="$(REC_CXXFLAGS)" CFLAGS="$(REC_CFLAGS)"

clean-libs:
	cd $(TOOLS) && rm -f *.a
	cd $(LT) && make clean
	cd $(DHELAS) && make clean
	cd $(SLHA) && make clean

clean clean-all: clean-libs
	cd neuIchaJ && make clean-all

print-info:
	$(info )
	$(info --> Now change into directory neuIchaJ and type)
	$(info     "make clean-results && make -j4 do" to run the program)
	
########################################################################
#                       -*- End of Makefile -*-                        #
########################################################################