(defparameter *nodes* '((humano (
                             (mago (
                                 (fuego (humano mago fuego))
                                 (hielo (humano mago hielo))
                                 (tierra (humano mago tierra))
                                 (aire (humano mago aire))
                                 (rayo (humano mago rayo))))
                             (caballero (
                                 (espada (humano caballero espada))
                                 (lanza (humano caballero lanza))
                                 (hacha (humano caballero hacha))
                                 (martillo (humano caballero martillo))
                                 (escudo (humano caballero escudo))))
                             (arquero (
                                 (arco (humano arquero arco))
                                 (ballesta (humano arquero ballesta))
                                 (flecha_fuego (humano arquero flecha_fuego))
                                 (flecha_hielo (humano arquero flecha_hielo))
                                 (flecha_veneno (humano arquero flecha_veneno))))
                             (asesino (
                                 (sigilo (humano asesino sigilo))
                                 (daga (humano asesino daga))
                                 (veneno (humano asesino veneno))
                                 (sombra (humano asesino sombra))
                                 (golpe_letal (humano asesino golpe_letal))))))
                       (elfo (
                             (mago (
                                 (fuego (elfo mago fuego))
                                 (hielo (elfo mago hielo))
                                 (tierra (elfo mago tierra))
                                 (aire (elfo mago aire))
                                 (rayo (elfo mago rayo))))
                             (caballero (
                                 (espada (elfo caballero espada))
                                 (lanza (elfo caballero lanza))
                                 (hacha (elfo caballero hacha))
                                 (martillo (elfo caballero martillo))
                                 (escudo (elfo caballero escudo))))
                             (arquero (
                                 (arco (elfo arquero arco))
                                 (ballesta (elfo arquero ballesta))
                                 (flecha_fuego (elfo arquero flecha_fuego))
                                 (flecha_hielo (elfo arquero flecha_hielo))
                                 (flecha_veneno (elfo arquero flecha_veneno))))
                             (asesino (
                                 (sigilo (elfo asesino sigilo))
                                 (daga (elfo asesino daga))
                                 (veneno (elfo asesino veneno))
                                 (sombra (elfo asesino sombra))
                                 (golpe_letal (elfo asesino golpe_letal))))))
                       (ogro (
                             (mago (
                                 (fuego (ogro mago fuego))
                                 (hielo (ogro mago hielo))
                                 (tierra (ogro mago tierra))
                                 (aire (ogro mago aire))
                                 (rayo (ogro mago rayo))))
                             (caballero (
                                 (espada (ogro caballero espada))
                                 (lanza (ogro caballero lanza))
                                 (hacha (ogro caballero hacha))
                                 (martillo (ogro caballero martillo))
                                 (escudo (ogro caballero escudo))))
                             (arquero (
                                 (arco (ogro arquero arco))
                                 (ballesta (ogro arquero ballesta))
                                 (flecha_fuego (ogro arquero flecha_fuego))
                                 (flecha_hielo (ogro arquero flecha_hielo))
                                 (flecha_veneno (ogro arquero flecha_veneno))))
                             (asesino (
                                 (sigilo (ogro asesino sigilo))
                                 (daga (ogro asesino daga))
                                 (veneno (ogro asesino veneno))
                                 (sombra (ogro asesino sombra))
                                 (golpe_letal (ogro asesino golpe_letal))))))
                       (enano (
                             (mago (
                                 (fuego (enano mago fuego))
                                 (hielo (enano mago hielo))
                                 (tierra (enano mago tierra))
                                 (aire (enano mago aire))
                                 (rayo (enano mago rayo))))
                             (caballero (
                                 (espada (enano caballero espada))
                                 (lanza (enano caballero lanza))
                                 (hacha (enano caballero hacha))
                                 (martillo (enano caballero martillo))
                                 (escudo (enano caballero escudo))))
                             (arquero (
                                 (arco (enano arquero arco))
                                 (ballesta (enano arquero ballesta))
                                 (flecha_fuego (enano arquero flecha_fuego))
                                 (flecha_hielo (enano arquero flecha_hielo))
                                 (flecha_veneno (enano arquero flecha_veneno))))
                             (asesino (
                                 (sigilo (enano asesino sigilo))
                                 (daga (enano asesino daga))
                                 (veneno (enano asesino veneno))
                                 (sombra (enano asesino sombra))
                                 (golpe_letal (enano asesino golpe_letal))))))))

(defun recorre (lista) 
    (when lista 
        (let ((elemento (car lista)))
            (format t "¿Tu personaje es -a?-%" (car elemento)) 
         ;   (format t "Atributos: -a-%" (cadr elemento)) 
         (recorre (cdr lista))
        )
    )
)


(defun recorre (lista) 
    (format t "¿Tu personaje es ~a ?" (car lista) )
    (print (car lista)) 
    (if lista 
        (recorre (cdr lista))
    )
)