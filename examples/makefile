DC:=dmd
IMPORTS=-I../
LIBS=-L-lzmq -L-lczmq
SOURCES=test_zsocket test_zclock test_zctx test_zsockopt czmq_selftest \
test_zstr


################################################################################
#	'all' assumes that flags conform to dmd. (dmd -inline -O...)
#	It also assumes that you have DC and DFLAGS predefined.
################################################################################

all: $(SOURCES)

%: %.o
	$(DC) $< $(LIBS) -of$@

%.o: %.d
	$(DC) $(DFLAGS) $(IMPORTS) -c $<

run: $(SOURCES)
	$(SOURCES:%=./%)
################################################################################
#	gdmd will compile using DFLAGS, so.. set them.
#	Same as with dmd:
################################################################################
gdmd:
	export DC=gdmd && $(MAKE) -e
###		For some reason gdmd works on my system, but gdc doesn't...
gdc:
	export DC=gdc && export DFLAGS="$(CFLAGS)" && $(MAKE) -e

################################################################################
#	Clean up all of the files [g]dmd could have possibly written.
################################################################################
clean:
	rm -rf *.o *.gcov *.gcda *.gcno $(SOURCES)

