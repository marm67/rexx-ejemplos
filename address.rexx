/* rexx */
/*
trace ?i
    'ls -la'
    address system 'ls -la' output stem sal.
*/

    call comando4

exit


comando1: procedure
    "ls | rxqueue"
    do i=1 while queued() \= 0
      parse pull line
      say i || ") " || line
    end
return

comando2: procedure
    address system ls with output fifo '' error normal
    do i=1 while queued() \= 0
        parse pull line
        say i || ") " || line
    end
return

comando3: procedure
    address system with output fifo '' error normal
    ls
    do i=1 while queued()\=0
        parse pull ln
        say i||") "||ln
    end
return

comando4: procedure
    ls. = undef
    address system ls with output stem ls.
    do i=1 to ls.0
        say i || ") " || ls.i
    end
return
