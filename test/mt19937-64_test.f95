program mt19937_64_test

  use, intrinsic :: iso_fortran_env
  use mt19937_64
  implicit none

  integer, parameter :: i8 = int64

  integer(i8) :: seed(4)
  integer     :: i

  seed = (/x'12345', x'23456', x'34567', x'45678'/)
  call init_by_array64(seed)

  write(*, '(a)') '1000 outputs of genrand64_real1()'
  do i = 1, 1000
    write(*, '(f12.8)', advance='no') genrand64_real1()
    if(mod(i, 5) == 0) write(*,*)
  end do

  write(*,*)

  write(*, '(a)') '1000 outputs of genrand64_real2()'
  do i = 1, 1000
    write(*, '(f12.8)', advance='no') genrand64_real2()
    if(mod(i, 5) == 0) write(*,*)
  end do

  write(*,*)

  write(*, '(a)') '1000 outputs of genrand64_real3()'
  do i = 1, 1000
    write(*, '(f12.8)', advance='no') genrand64_real3()
    if(mod(i, 5) == 0) write(*,*)
  end do

end program mt19937_64_test
