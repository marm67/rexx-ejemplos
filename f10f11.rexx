/* rexx */

    head1 = 'C PROGRAMA' 
    head2 = '- --------'
    Call CreaCampos

    PantallaColumnas           = 80
    PantallaLongitudParteFija  = 10
    PantallaLongitudParteMovil = PantallaColumnas - PantallaLongitudParteFija + 1    
    iColMin = 1
    iColMax = length(head1) - PantallaLongitudParteMovil
    iCol    = iColMin

    do forever
        pull entrada
        if entrada = 'QUIT' then leave
        parse var entrada op inc .
        if inc = '' then inc = PantallaLongitudParteMovil
        if op = 'I' then
            if inc = 'M' then
                iCol = iColMin
            else
                iCol = Max(1, iCol - inc)
        if op = 'D' then
            if inc = 'M' then
                iCol = iColMax
            else
                iCol = Min(iColMax, iCol + inc)
        
        linea1 = DividirLinea(head1)
        say linea1
        linea2 = DividirLinea(head2)
        say linea2

        call sleep 0
    end

return

DividirLinea:
arg linea
trace o
    parse var linea fija +(PantallaLongitudParteFija) movil
    parse value movil with . +(iCol) movil
    movil = left(movil, PantallaLongitudParteMovil)
trace o
return fija movil

CreaCampos:
    largos = '10 15 8 9 12 4 13 7 9 15 10 15 8 8 12 14 13 7 9 15'
    blancos20 = Copies(' ', 20)
    digitos = '123456789012345678901234567890'
    Do i=1 To Words(largos)
        largo = Word(largos, i)
        head1 = head1 Left(digitos, largo)
        head2 = head2 Copies('-',largo)
    End 
Return






