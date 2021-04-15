# CXX = g++
# intel mac
#CXX = /usr/local/opt/llvm/bin/clang
# m1 mac
CXX = /opt/homebrew/opt/llvm/bin/clang++
CFLAGS = -std=c++11 -Wall -O3 -msse2  -fopenmp -I/opt/homebrew/opt/llvm/include -I..
#CFLAGS = -v -std=c++11 -Wall -O3 -msse2  -Xpreprocessor -fopenmp -libomp  -I..
#LDFLAGS=$(LDFLAGS) -L/usr/local/opt/llvm/lib

BIN = ./bin/segphrase_train ./bin/segphrase_segment
.PHONY: clean all

all: ./bin $(BIN)

./bin/segphrase_train: ./src/main.cpp ./src/utils/*.h ./src/frequent_pattern_mining/*.h ./src/data/*.h ./src/classification/*.h ./src/model_training/*.h ./src/clustering/*.h
./bin/segphrase_segment: ./src/segment.cpp ./src/utils/*.h ./src/frequent_pattern_mining/*.h ./src/data/*.h ./src/classification/*.h ./src/model_training/*.h ./src/clustering/*.h

./bin:
	mkdir -p bin

LDFLAGS= -pthread -lm -Wno-unused-result -Wno-sign-compare -Wno-unused-variable -Wno-parentheses -Wno-format
$(BIN) :
	@echo "bin"
	# intel Mac
	# $(CXX) $(CFLAGS) $(LDFLAGS) -L/usr/local/opt/llvm/lib -o $@ $(filter %.cpp %.o %.c, $^)
	# M1 mac
	$(CXX) -arch arm64 $(CFLAGS) $(LDFLAGS) -L/opt/homebrew/opt/llvm/lib  -o $@ $(filter %.cpp %.o %.c, $^)
$(OBJ) :
	@echo "obj"
	$(CXX) -c $(CFLAGS) -o $@ $(firstword $(filter %.cpp %.c, $^) )

clean :
	rm -rf bin
