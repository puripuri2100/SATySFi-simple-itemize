.PHONY: test

test:
	satysfi test/test.saty -o test/test.pdf


testdebug:
	satysfi --debug-show-bbox --debug-show-space --debug-show-block-bbox --debug-show-block-space test/test.saty -o test/test.pdf