/* rexx */
/*
    string = translate(string, tableo, tablei, pad)

    Dos usos:
        Parecido al comando tr.
            Para cada caracter de la cadena de entrada:
                Busca el caracter en tablei de izquierda a derecha (si hay duplicados en tablei, se coje el primero: el mas a la izquierda)
                    Si lo encuentra:        lo sustituye en la cadena de salida por el correspondiente en tableo (el de la misma posicion)
                    Si no lo encuentra:     pone el caracter de la cadena de entrada
            El resultado tiene siempre la misma longitud que la entrada   

        Para reorganizar caracteres de una cadena
            salida = translate(formato_salida, entrada, formato_entrada)
                     Busca cada caracter del formato de salida en el formato de entrada y lo sustituye por el valor que tenga en la expresion

            translate('78/56/1234', '20170711', '12345678') -> 11/07/2017

*/
    /*say translate1('Para cada caracter de la cadena de entrada', 'io', 'ae')*/

    say translate('78/56/1234', '20170711', '12345678') 
    say format(123456789.53)
    say FormatNumber(123456789.53)
exit

format: procedure
parse value arg(1) with entero '.' decimal
    formato = strip( reverse( translate( "abc.def.ghi.jkl.mno",,
                                    reverse(entero),,
                                    "abcdefghijklmno",".")),"L",".")
    if decimal <> '' then formato = formato','decimal
return formato

translate1: procedure
parse arg entrada, tablao, tablai
    say entrada
    salida = ''
    do i = 1 to length(entrada)
        ch      = substr(entrada, i, 1)
        ptablai = pos(ch, tablai)
        if ptablai > 0 then ch = substr(tablao, ptablai, 1)
        salida = salida||ch
    end
return salida

/*
    http://www.edm2.com/index.php/REXX
    http://www.edm2.com/index.php/REXX_Tips_%26_Tricks
*/

/* ------------------------------------------------------------------ */
/* function: Format a number like 123456789.44 into the format        */
/*           123,456,789.44                                           */
/*                                                                    */
/* call:     FormatNumber number_to_format                            */
/*                                                                    */
/* where:    number_to_format                                         */
/*                                                                    */
/* returns:  the formatted number                                     */
/*                                                                    */
/* note:     works for all numbers up to (but not including)          */
/*           1.000,000,000,000,000.0                                  */
/*                                                                    */
/* Author:   Graham Ewart                                             */
/*                                                                    */
FormatNumber: PROCEDURE expose (exposeList)
  parse value arg(1) with whole "." decs

  formattedNumber = strip( reverse( translate( "abc,def,ghi,jkl,mno",,
                                   reverse(whole),,
                                   "abcdefghijklmno",",")),"L",",")

  if decs <> "" then
    formattedNumber = formattedNumber || "." || decs
RETURN formattedNumber

/* ------------------------------------------------------------------ */
/* function: Unformat a number like 123,456,789.44 into the format    */
/*           123456789.44                                             */
/*                                                                    */
/* call:     UnFormatNumber number_to_unformat                        */
/*                                                                    */
/* where:    number_to_unformat                                       */
/*                                                                    */
/* returns:  the unformatted number                                   */
/*                                                                    */
/* note:     works for all numbers                                    */
/*                                                                    */
UnFormatNumber: PROCEDURE

RETURN space( translate( arg(1), " ", "," ) , 0, )

