.PHONY:test1,test2,clean
test1:
	arm-linux-gnueabihf-g++ -g test_2_2.s -o Test1 -static
	./Test1
test2:
	arm-linux-gnueabihf-g++ -g test_2.s -o Test2 -static
	./Test2
clean:
	rm -fr Test1 Test2