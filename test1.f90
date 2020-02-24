
! Basic FORTRAN Code for testing openmp commands


program main

USE OMP_LIB
USE mod1

implicit none

! Declare Variables here
real*8 :: var1, var2, var3, temp1, temp2, temp3
real*8, dimension(:), allocatable :: arr1, arr2
integer :: ii, jj, OMP_NUM_THREAD, n = 1e6
integer ::   id


! CPU_TIME Variables
real*8 :: time_ser_cpu_time, time_ser_end, time_ser_begin
real*8 :: time_par, time_par_end, time_par_begin

! SYSTEM_CLOCK Variables
real*8 :: time_ser_sys_clock, time_ser_sys_begin, time_ser_sys_end
real*8 :: time_par_sys_clock, time_par_sys_begin, time_par_sys_end
integer :: count_0, count_1, countp_0, countp_1
integer :: count_max, count_rate

! openmp get time_par
real*8 :: time_omp_ser_begin,time_omp_ser_end, time_omp_ser
real*8 :: time_omp_par_begin,time_omp_par_end, time_omp_par


! Execute Code here


! Initializing Variables here
ALLOCATE(arr1(n))
ALLOCATE(arr2(n))

arr1 = 0.d0
arr2 = 0.d0

var1 = 0.51
var2 = 0.78

! Start Execution here

var3 = var1+var2


time_omp_ser_begin=  omp_get_wtime()
CALL CPU_TIME(time_ser_begin)
CALL SYSTEM_CLOCK(count_0, count_rate, count_max)

do ii=1,n

  arr1(ii) = arr1(ii)+ var2
  !arr1(ii) = arr1(ii)*var2
  !arr1(ii) = arr1(ii)+5 - 981.0

end do

time_omp_ser_end =  omp_get_wtime()
CALL CPU_TIME(time_ser_end)
CALL SYSTEM_CLOCK(count_1, count_rate, count_max)

time_ser_cpu_time = time_ser_end - time_ser_begin
time_ser_sys_begin = count_0*1.d0/count_rate
time_ser_sys_end = count_1*1.d0/count_rate
time_ser_sys_clock = time_ser_sys_end-time_ser_sys_begin

time_omp_ser = time_omp_ser_end - time_omp_ser_begin

!print*, "Time taken for the serial code using cpu time is", time_ser_cpu_time
!print*, "Time serial begin is", time_ser_begin
!print*, "Time serial end is", time_ser_end

!print*, "Time taken for serial code using system clock is",time_ser_sys_clock
print*, "Time taken for serial code using the omp function is", time_omp_ser

! Calling a subroutine here

CALL RANDOM_NUMBER(temp1)
CALL RANDOM_NUMBER(temp2)

CALL sub1(temp1,temp2,temp3)

print*, " "
print*, "temp3 is", temp3


!----------------------------------------------------------------------------------!
!---------------- PARALLEL Region starts here----------------------------------------!
!----------------------------------------------------------------------------------!
print*, "Number of Threads are", OMP_GET_MAX_THREADS()

!$OMP PARALLEL

!print*, "Hello World!"
!print*, "Number of Threads are", OMP_GET_MAX_THREADS()
!print*, "variable 3 value is", var3

!$OMP END PARALLEL

! Parallel Loop starts here
CALL CPU_TIME(time_par_begin)
CALL SYSTEM_CLOCK(countp_0, count_rate, count_max)
time_omp_par_begin =  omp_get_wtime()

!$OMP PARALLEL

!$OMP DO

do ii=1,n
  !print*, omp_get_thread_num()

  arr2(ii) = arr2(ii) + var3
  !arr2(ii) = arr2(ii)*var2
  !arr2(ii) = arr2(ii)+5 - 981.0

end do

!$OMP END DO
!$OMP END PARALLEL

CALL CPU_TIME(time_par_end)
CALL SYSTEM_CLOCK(countp_1, count_rate, count_max)
time_omp_par_end =  omp_get_wtime()

time_par = time_par_end - time_par_begin
time_par_sys_begin = countp_0*1.d0/count_rate
time_par_sys_end = countp_1*1.d0/count_rate
time_par_sys_clock = time_par_sys_end-time_par_sys_begin
time_omp_par = time_omp_par_end - time_omp_par_begin

print*, " "
print*, " "

!print*, "Time taken for the parallel code using cpu time is", time_par
!print*, "Time taken for the parallel code using system clock is", time_par_sys_clock
print*, "Time taken for the parallel code using omp function is", time_omp_par
print*, " "
print*, " "

print*, "Speedup is", time_omp_ser/time_omp_par

!print*, "Time parallel begin is", time_par_begin
!print*, "Time parallel end is", time_par_end

!pause

end program main
