SUBDIRS := $(wildcard plugins/*/.)

all:
	for dir in $(SUBDIRS); do \
		cd $$dir && go build && cd ../../; \
	done

install:
	for dir in $(SUBDIRS); do \
		cd $$dir && go install && cd ../../; \
	done

clean:
	for dir in $(SUBDIRS); do \
		cd $$dir && go clean && cd ../../; \
	done

lint:
	golangci-lint run --timeout 5m

test:
	go test ./...

.PHONY: all install clean test $(SUBDIRS)
