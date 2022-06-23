(deffacts examen
    (mesa bloques C B A 0)
    (bloques A B C D E)
    (robot bloque 0 0)
)




(defrule coger-bloque
    (declare (salience 10))
    ?f <-(bloques $?ini ?z)
    (test(= ?llevando 0))
    =>
    (printout t "Cojo el bloque" ?z crlf)
    (retract ?f)
    (assert (robot bloque ?z  (+ ?llevando 1)))
)



(defrule poner-bloque
    (declare (salience 20))
    ?f <-(mesa bloques $?ini ?y)
    (test(= ?llevando 1))
    =>
    (printout t "Pongo el bloque" ?y crlf)
    (retract ?f)
    (assert(mesa bloques $?ini ?y (- ?llevando 1)))
)


(defrule retirar-bloque
    ?f <-(mesa bloques $?ini ?x ?llevando)
    (test(= ?llevando 0))
    =>
    (printout t "Retiro el paquete" ?x crlf)
    (retract ?f)
    (assert(mesa bloques $?ini ?llevando)))
)