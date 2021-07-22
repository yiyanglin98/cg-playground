EXENAME = main
OBJS = main.o

CXX = clang++
CXXFLAGS = -std=c++1y -stdlib=libc++ -c -g -Wall -Wextra -pedantic
LD = clang++
LDFLAGS = -std=c++1y -stdlib=libc++ -lc++abi -lm

.PHONY: all test clean output_msg

all : $(EXENAME)

output_msg: ; $(CLANG_VERSION_MSG)

$(EXENAME) : output_msg $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(EXENAME)

main.o : main.cpp color.h vec3.h
	$(CXX) $(CXXFLAGS) main.cpp

render : main
	./main > image.ppm

clean :
	-rm -f *.o $(EXENAME) *.ppm