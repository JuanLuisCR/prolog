def dividir_con_restas_recursivo(dividendo, divisor):
    # Caso base: si el dividendo es menor que el divisor, la división ha terminado
    if dividendo < divisor:
        return 0, dividendo  # El cociente es 0 y el resto es el dividendo
    
    # Llamada recursiva restando el divisor del dividendo
    cociente, resto = dividir_con_restas_recursivo(dividendo - divisor, divisor)
    
    # Aumentamos el cociente en 1 con cada llamada recursiva exitosa
    return cociente + 1, resto

# Ejemplo de uso
dividendo = 17
divisor = 3

cociente, resto = dividir_con_restas_recursivo(dividendo, divisor)
