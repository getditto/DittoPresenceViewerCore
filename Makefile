#
# Makefile
# DittoPresenceViewer
#

################################################################################
#
# Variables
#

CMD_NAME = swiftcli
SHELL = /bin/bash

SWIFT_VERSION = ${shell cat .swift-version}

# set EXECUTABLE_DIRECTORY according to your specific environment
# run swift build and see where the output executable is created

# OS specific differences
UNAME = ${shell uname}

ifeq ($(UNAME), Darwin)
	SWIFTC_FLAGS =
	LINKER_FLAGS = -Xlinker -L/usr/local/lib
	PLATFORM = x86_64-apple-macosx
	EXECUTABLE_DIRECTORY = ./.build/${PLATFORM}/debug
	TEST_BUNDLE = ${CMD_NAME}PackageTests.xctest
	TEST_RESOURCES_DIRECTORY = ./.build/${PLATFORM}/debug/${TEST_BUNDLE}/Contents/Resources
endif
ifeq ($(UNAME), Linux)
	SWIFTC_FLAGS = -Xcc -fblocks
	LINKER_FLAGS = -Xlinker -rpath -Xlinker .build/debug
	PATH_TO_SWIFT = /home/vagrant/swiftenv/versions/$(SWIFT_VERSION)
	PLATFORM = x86_64-unknown-linux
	EXECUTABLE_DIRECTORY = ./.build/${PLATFORM}/debug
	TEST_RESOURCES_DIRECTORY = ${EXECUTABLE_DIRECTORY}
endif

RUN_RESOURCES_DIRECTORY = ${EXECUTABLE_DIRECTORY}

################################################################################
#
# Help
#

.DEFAULT_GOAL := help

.PHONY: help
help: MAKEFILE_FMT = "  \033[36m%-25s\033[0m%s\n"
help: ## (default) Displays this message
	@echo "DittoPresenceViewer Makefile"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z0-9_-]*:.*?##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?##"}; {printf $(MAKEFILE_FMT), $$1, $$2}'
	@echo ""
	@echo "Parameters:"
	@grep -E '^[A-Z0-9_-]* ?\?=.*?##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = " ?\\?=.*?##"}; {printf $(MAKEFILE_FMT), $$1, $$2}'
: # Hacky way to display a newline ##

################################################################################
#
# Targets
#

.PHONY: version
version: ## Shows versions of tools
	xcodebuild -version
	swift --version
	swift package tools-version

.PHONY: init
init: ## Installs required tools
	brew bundle install --no-upgrade --verbose

.PHONY: clean
clean: ## Cleans build folders
	swift package clean
	swift package reset

.PHONY: describe
describe: ## Shows the package description
	swift package describe

.PHONY: resolve
resolve: ## Installs package dependencies
	swift package resolve

.PHONY: dependencies
dependencies: resolve ##  Show package depencencies
	swift package show-dependencies

.PHONY: update
update: resolve ## Updates dependencies
	swift package update

.PHONY: build
build: ## Builds the package
	swift build $(SWIFTC_FLAGS) $(LINKER_FLAGS)

.PHONY: test
test: build ## Tests the package
	swift test --enable-test-discovery

.PHONY: run
# make run ARGS="asdf"
run: build ## Runs the project executible
	${EXECUTABLE_DIRECTORY}/${CMD_NAME} $(ARGS)
