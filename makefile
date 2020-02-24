# Start of the makefile
test1: test1.o mod1.o
	gfortran -o test1 test1.o mod1.o -fopenmp
mod1.mod: mod1.o mod1.f90
	gfortran -c mod1.f90
mod1.o: mod1.f90
	gfortran -c mod1.f90
test1.o: mod1.mod test1.f90
	gfortran -c test1.f90 -fopenmp
#function1.o: global.mod function1.f90
#    ifort -c function1.f90
#subroutine1.o: subroutine1.f90
#    ifort -c subroutine1.f90
#clean:
#    rm global.mod global.o main.o function1.o subroutine1.o execname
# End of the makefile
