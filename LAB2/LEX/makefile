.PHONY:lc,lcc,clean
lc:
	flex SysY.l
	g++ lex.yy.c -o lc.out
	./lc.out testin testout
lcc:
	flex -+ SysY.l
	g++ lex.yy.cc -o lcc.out
	./lc.out testin testout
clean:
	rm *.out