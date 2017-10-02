CC=cl65
CFLAGS=-ttelestrat
LDFILES=src/mymcc65.s


AS=xa
ASFLAGS_O65=-v -R -cc  -DTARGET_FILEFORMAT_O65  -DTARGET_ORIX

CO=co65

PROGRAM=mym
SOURCE=src/mym.c

ASFLAGS=-C -W -e error.txt -l xa_labels.txt -DTARGET_ORIX

%.o: src/mymDbug.s
	$(AS) $(ASFLAGS) -o -o src/mymplayer.o 
	$(CO) src/mymplayer.o -o src/mymcc65.s

$(PROGRAM): $(SOURCE)
	$(CC) $(SOURCE) $(CFLAGS) -o build/bin/$(PROGRAM) $(LDFILES)
