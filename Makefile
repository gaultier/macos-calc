FILES=$(wildcard *.h *.m)
calc: $(FILES)
	$(CC) -g -x objective-c $(FILES) -framework Cocoa -fobjc-arc -o $@

./Contents/Resources/Base.lproj/MainMenu.nib: MainMenu.xib
	ibtool $^ --compile $@


