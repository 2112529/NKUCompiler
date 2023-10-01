.PHONY: test-c,test-cpp, clean
test-c:
	arm-linux-gnueabihf-gcc FibTest.c -o FibTest_C -static
	qemu-arm ./FibTest_C
test-cpp:
	arm-linux-gnueabihf-g++ FibTest.cpp -o FibTest_CPP -static
	qemu-arm ./FibTest_CPP
clean:
	rm -fr *.out
