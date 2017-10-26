CC=cl65
CO=co65
AS=xa

CFLAGS=-ttelestrat
LDFILES=src/mymcc65.s
ASFLAGS_O65=-v -R -cc  -DTARGET_FILEFORMAT_O65 -DTARGET_ORIX

PROGRAM=mym
SOURCE=src/mym.c

ASFLAGS=-C -W -e error.txt -l xa_labels.txt -DTARGET_ORIX

%.o: src/mymDbug.s
	$(AS) $(ASFLAGS) -o src/mymplayer.o 
	$(CO) src/mymplayer.o -o src/mymcc65.s

$(PROGRAM): $(SOURCE)
	$(CC) $(SOURCE) $(CFLAGS) -o build/bin/$(PROGRAM) $(LDFILES)

test:
	mkdir -p build/bin/
	mkdir -p build/usr/share/man
	mkdir -p build/usr/share/ipkg
	mkdir -p build/usr/share/$(PROGRAM)/
	cp $(PROGRAM) build/bin/
	cp src/man/$(PROGRAM).hlp build/usr/share/man
	cp src/ipkg/$(PROGRAM).csv build/usr/share/ipkg
	cd build &&	tar -c * > ../$(PROGRAM).tar && cd ..
	filepack  $(PROGRAM).tar $(PROGRAM).pkg
	gzip $(PROGRAM).tar
	mv $(PROGRAM).tar.gz $(PROGRAM).tgz
	php buildTestAndRelease/publish/publish2repo.php $(PROGRAM).pkg ${hash} 6502 pkg
	php buildTestAndRelease/publish/publish2repo.php $(PROGRAM).tgz ${hash} 6502 tgz  
	echo nothing