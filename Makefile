beditd: beditd.pas
	fpc -O2 -gl beditd.pas

clean:
	rm -f beditd *.o *.ppu
