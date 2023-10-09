.PHONY:test,clean
test:
	arm-linux-gnueabihf-g++ -g Prime.s -o prime -static
	./prime
clean:
	rm -fr prime