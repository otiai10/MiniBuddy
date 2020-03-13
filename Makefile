
clean:
	rm -f MiniBuddy.zip

build:
	swift build -c release

MiniBuddy.zip:
	mkdir -p MiniBuddy
	cp $(shell swift build -c release --show-bin-path)/minibuddy MiniBuddy
	cp ./LICENSE MiniBuddy
	zip -r MiniBuddy.zip MiniBuddy/*
	rm -rf MiniBuddy

release: clean build MiniBuddy.zip
