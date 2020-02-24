! Added a module here to be used by test1

MODULE mod1

implicit none



contains

! First subroutine
  subroutine sub1(temp1,temp2,temp3)

    implicit none

    ! Declare Variables here
    real*8, intent(in):: temp1,temp2
    real*8, intent(out) :: temp3


    temp3 = sqrt(temp1)*temp2

  end subroutine sub1

! Second subroutine




END MODULE mod1
