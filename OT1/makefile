.PHONY:test,test1,test2
test:
	yacc Core.y 
	gcc y.tab.c -o NFA
	./NFA
test1:
	gcc NFA2DFA.c -o NFA2DFA
	./NFA2DFA
test2:
	gcc DFAmin.c -o DFAmin
	./DFAmin
