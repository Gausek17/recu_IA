(deffacts examen
    (mesa bloques C B A 0)
    (bloques A B C D E)
    (robot bloque 0 0)
)




(defrule coger-bloque
    (declare (salience 10))
    ?f <-(bloques $?ini ?z)
    =>
    (printout t "Cojo el bloque" ?z crlf)
    (retract ?f)
    (assert (robot bloque ?z  (= ?llevando 1)))
)


(defrule depositar-bloque
    (declare (salience 20))
    ?f <-(robot bloque ?z ?llevando)
    (test(= ?llevando 1))
    =>
    (printout t "Deposito el bloque" ?z crlf)
    (retract ?f)
    (assert(mesa bloques $?ini ?z (= ?llevando 0)))
)




(defrule retirar-bloque
    ?f <-(mesa bloques $?ini ?x ?llevando)
    (test(= ?llevando 0))
    =>
    (printout t "Retiro el bloque" ?x crlf)
    (retract ?f)
    (assert(mesa bloques $?ini ?llevando)))
)