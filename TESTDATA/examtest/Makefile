test: test.o 
	gcc test.o -o test -lgcov

test.o: test.c 
	gcc -fprofile-arcs -ftest-coverage -c test.c -o test.o

zero: 
	lcov --directory . --zerocounters
	
single.ll: test.ll
	llvm-link -S -v -o single.ll test.ll
	
test.ll: test.c
	clang -S -emit-llvm test.c -g	

clean:
	rm -rf *.ll
	rm -rf *.o
	rm -rf test.gcno
	rm -rf test.gcda
	rm -rf test.bc
	rm -rf test
	rm -rf *.c.gcov.json
