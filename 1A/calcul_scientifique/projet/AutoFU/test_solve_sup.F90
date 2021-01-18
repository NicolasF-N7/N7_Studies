subroutine left_looking_solve(U, x, b, n)
    implicit none
    integer, intent(in) :: n
    double precision, intent(in), dimension(n) :: b
    double precision, intent(out), dimension(n) :: x
    double precision, intent(in), dimension(n,n) :: U
    
    integer :: i,j

    x = b
    do j=n,1,-1
        !do i=n,j+1,-1
        do i=j+1,n
            x(j) = x(j) - u(j,i) * x(i)
        end do
        x(j) = x(j) / u(j,j)
    end do
    return
end subroutine left_looking_solve

subroutine right_looking_solve(U, x, b, n)
    implicit none
    integer, intent(in) :: n
    double precision, dimension(n), intent(in) :: b
    double precision, dimension(n,n), intent(in) :: U
    double precision, dimension(n), intent(out) :: x
    integer :: i,j

    x = b
    do j=n,1,-1
        x(j) = x(j) / u(j,j)        
        do i=1,j-1
            x(j) = x(j) - u(j,i) * x(i)
        end do
    end do

end subroutine right_looking_solve

real function norm(x, n)
    implicit none
    integer, intent(in) :: n
    real, dimension(n), intent(in) :: x

    norm = 0.0
end function norm

real function backward_error(U,x,b,n)
    implicit none
    integer, intent(in) :: n
    real, dimension(n), intent(in) :: b
    real, dimension(n,n), intent(in) :: U
    real, dimension(n), intent(out) :: x

    backward_error = norm2(matmul(U, x) - b) / norm2(b)
end function backward_error

program test_solve

    implicit none

    integer :: i, j, ierr, n
    double precision, dimension (:,:), allocatable :: U
    double precision, dimension (:), allocatable :: x, b
    real :: t1, t2

    write(*,*)
    write(*,*) 'Choose the size n :'
    read(*,*) n
    write(*,*)

    ! Initialization: U is lower triangular
    write(*,*) 'Initialization ...'
    write(*,*)

    allocate(U(n,n), stat = ierr)
    if(ierr.ne.0) then
        write(*,*)'Could not allocate U(n,n) with n =', n
        write(*,*)
        goto 999
    end if

    allocate(x(n), stat = ierr)
    if(ierr.ne.0) then
        write(*,*)'Could not allocate x(n) with n =', n
        write(*,*)
        goto 999
    end if

    allocate(b(n), stat = ierr)
    if(ierr.ne.0) then
        write(*,*)'Could not allocate b(n) with n =', n
        write(*,*)
        goto 999
    end if

    U = 0.D0
    do i = 1, n
        U(i,i) = n + 1.D0
        do j = i+1, n
            U(i,j) = 1.D0
        end do
    end do
    b = 1.D0

    ! Left-looking triangular solve of Ux = b
    write(*,*) 'Solving with a left-looking method ...'
    
    call cpu_time(t1)
    call left_looking_solve(U, x, b, n)
    call cpu_time(t2)

    print *, "Time for left looking solve: ", t2-t1, "seconds."

    ! Right-looking triangular solve of Ux = b
    write(*,*) 'Solving with a right-looking method ...'

    call cpu_time(t1)
    call right_looking_solve(U, x, b, n)
    call cpu_time(t2)

    print *, "Time for right looking solve: ", t2-t1, "seconds."

999 if(allocated(U)) deallocate(U)
    if(allocated(x)) deallocate(x)
    if(allocated(b)) deallocate(b)

end program test_solve

! TODO
! Implement sub-programs
