;Funciones de area
(defun areaCuadrado()
    (princ "Ingresa la medida del lado: ")
    (setq lado (read)) 
    (setq area (* lado lado))
    (format t "El area del cuadrado es: ~a~%" area)
)

(defun areaCirculo()
    (princ "Ingresa el radio del circulo: ")
    (setq radio(read))
    (setq pi 3.14159)
    (setq area (* pi radio radio))
    (format t "El area del circulo es: ~a~%" area)
)

(defun areaTriangulo()
    (princ "Ingresa la base del triangulo: ")
    (setq base(read))
    (princ "Ingresa la altura del triangulo: ")
    (setq (/ altura 2(read)))
    (setq area(* base altura))
    (format t "El area del triangulo es: ~a~%" area)
)

(defun areaRectangulo()
    (princ "Ingresa la base del rectángulo: ")
    (setq base(read))
    (princ "Ingresa la altura del rectángulo: ")
    (setq altura (read))
    (setq area(* base altura))
    (format t "El area del rectángulo es: ~a~%" area)
)

(defun )