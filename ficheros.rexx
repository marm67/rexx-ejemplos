/* rexx */

entrada = 'p1.html'

do while lines(entrada) > 0
    call salida linein(entrada)
end

exit

salida: procedure
parse arg linea
    parse var linea p1 30 resto
    longitud = length(linea)
    say longitud "->" linea
    say strip(p1, 'T') " ++ " resto
return