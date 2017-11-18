CC=cl65
CO=co65
AS=xa

CFLAGS=-ttelestrat
LDFILES=src/mymcc65.s
ASFLAGS_O65=-v -R -cc  -DTARGET_FILEFORMAT_O65 -DTARGET_ORIX

PROGRAM=mym
SOURCE=src/mym.c

ASFLAGS=-v -R -cc  -e error.txt -l xa_labels.txt -DTARGET_ORIX

mymplayer.o: src/mymDbug.s
	$(AS) $(ASFLAGS)  src/mymDbug.s -o src/mymplayer.o 
	$(CO) src/mymplayer.o -o src/mymcc65.s
	$(CC) -o $(PROGRAM) $(CFLAGS) $(SOURCE)  $(LDFILES)

test:
	mkdir -p build/bin/
	mkdir -p build/usr/share/man
	mkdir -p build/usr/share/ipkg
	mkdir -p build/usr/share/$(PROGRAM)/
	mkdir -p build/usr/share/doc/$(PROGRAM)  
	cp $(PROGRAM) build/bin/
	cp src/man/$(PROGRAM).hlp build/usr/share/man
	cp src/ipkg/$(PROGRAM).csv build/usr/share/ipkg
	cp README.md build/usr/share/doc/$(PROGRAM)/  
	cd build &&	tar -c * > ../$(PROGRAM).tar && cd ..
	filepack  $(PROGRAM).tar $(PROGRAM).pkg
	gzip $(PROGRAM).tar
	mv $(PROGRAM).tar.gz $(PROGRAM).tgz
	php buildTestAndRelease/publish/publish2repo.php $(PROGRAM).pkg ${hash} 6502 pkg beta
	php buildTestAndRelease/publish/publish2repo.php $(PROGRAM).tgz ${hash} 6502 tgz beta 
	echo nothing
