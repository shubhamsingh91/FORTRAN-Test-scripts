program main

implicit none

! Declare Variables here
real*8 :: var1, var2, var3
real*8, dimension(10) :: arr1
integer :: ii, jj

! Execute Code here
! Initializing Variables here
arr1 = 0.d0

var1 = 0.51
var2 = 0.78

! Start Execution here

var3 = var1+var2

print*, "Hello World!"
print*, "variable 3 value is", var3

do ii=1,10

  arr1(ii) = arr1(ii)+ var3

end do

print*, "array 1 is", arr1

!pause

end program main
