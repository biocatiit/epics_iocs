# <top>/<appName>/src/makefile.gdct

#
# if a makefile.pvt exists - invoke it
# 
DBDIR           := $(shell basename `pwd`)

all:
	@if [ -f makefile.pvt ] ;then \
		echo "makefile.gdct - run makefile.pvt in the $(DBDIR) directory"; \
		$(MAKE) ${MFLAGS}  -f makefile.pvt; \
	else \
		echo "makefile.gdct - skipping the $(DBDIR) directory"; \
	fi ;
