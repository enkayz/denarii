REPORTER = dot

all: build

	build:
	@./node_modules/coffee-script/bin/coffee \
	-c \
	-o lib src

	clean:
	rm -rf lib
	mkdir lib

	watch:
	@./node_modules/coffee-script/bin/coffee \
	-o lib \
	-cw src

	test:
	@./node_modules/mocha/bin/mocha \
	--reporter $(REPORTER) \
	spec/*.coffee
	
	coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha \
	--report lcovonly -- -R spec && cat ./coverage/lcov.info \
	| ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

	.PHONY: build clean watch test coveralls
