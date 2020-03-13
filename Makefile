TEMP_DIR=/tmp/MiniBuddy

clean:
	rm -rf ${TEMP_DIR}
	rm -f MiniBuddy.zip
	swift package clean

build:
	swift build -c release

MiniBuddy.zip:
	mkdir -p $(TEMP_DIR)
	cp $(shell swift build -c release --show-bin-path)/minibuddy $(TEMP_DIR)
	cp ./LICENSE $(TEMP_DIR)
	(cd "$(TEMP_DIR)"; zip -yr - "minibuddy" "LICENSE") > "./MiniBuddy.zip"

release: clean build MiniBuddy.zip
