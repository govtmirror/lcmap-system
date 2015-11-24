LIB = $(PROJECT)
OS := $(shell uname -s)
ifeq ($(OS),Linux)
		HOST=$(HOSTNAME)
endif
ifeq ($(OS),Darwin)
		HOST = $(shell scutil --get ComputerName)
endif

setup:
	sudo gem install bundler
	cd docs && bundle install

push-all:
	@echo "Pusing code to github ..."
	git push --all
	git push upstream --all
	git push --tags
	git push upstream --tags
