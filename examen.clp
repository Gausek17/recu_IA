(deffacts examen
    (mesa bloques C B A 0)
    
)

(defrule poner-bloque




)


(defrule retirar-bloque
    ?f <-(mesa bloques $?ini ?x ?llevando)
    (test(= ?llevando 0))
    =>
    (printout t "Retiro el paquete" ?x crlf)
    (retract ?f)
    (assert(mesa bloques $?ini ?llevando)))
)