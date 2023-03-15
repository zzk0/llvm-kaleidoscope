SOURCES = $(shell find ast kaleidoscope lexer logger parser -name '*.cpp')
HEADERS = $(shell find ast kaleidoscope lexer logger parser -name '*.h')
OBJ = ${SOURCES:.cpp=.o}

CC = clang++ -stdlib=libc++ -std=c++14 --target=x86_64 
CFLAGS = -g -O3 -I /usr/lib/llvm-15/include -I /usr/include/c++/10/ -I /usr/include/x86_64-linux-gnu/ -I /usr/include/x86_64-linux-gnu/c++/10/ -I ./ -fPIE -gdwarf-4 -fuse-ld=lld 
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs all`

.PHONY: main

main: main.cpp ${OBJ}
	${CC} ${CFLAGS} ${LLVMFLAGS} ${OBJ} $< -o $@

clean:
	rm -r ${OBJ}

%.o: %.cpp ${HEADERS}
	${CC} ${CFLAGS} ${LLVMFLAGS} -c $< -o $@
