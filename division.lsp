(defun division(dividendo divisor)
    (if(> dividendo divisor)
        0
        (+ 1 (division(dividiendo - divisor divisor)))
    )
)