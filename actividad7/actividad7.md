
Universidad de San Carlos de Guatemala

Facultad de Ingeniería

Escuela de Ciencias y Sistemas

Sistemas Operativos 1

# ACTIVIDAD #7

## Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es un algoritmo de programación de procesos en Linux que se convirtió en el algoritmo de programación por defecto a partir de la versión 2.6.23 del kernel. Su funcionamiento se basa en asignar una proporción del tiempo de procesamiento de la CPU a cada tarea en lugar de utilizar reglas estrictas asociadas a un valor de prioridad relativa y un quantum de tiempo fijo.

Es un componente fundamental del kernel de Linux que gestiona la asignación de recursos de CPU entre los procesos en ejecución. Su diseño se basa en el principio de equidad, priorizando la justicia en la distribución del tiempo de CPU sobre otros factores como la velocidad de ejecución de los procesos.

Una de las características más destacadas del CFS es su capacidad para adaptarse dinámicamente a las condiciones cambiantes del sistema. En lugar de asignar prioridades estáticas, el CFS utiliza un sistema de pesos dinámicos basados en el concepto de "tiempo virtual" (vruntime). Este enfoque garantiza que los procesos con mayor prioridad obtengan una porción justa del tiempo de CPU en relación con su importancia relativa en el sistema.

La implementación del CFS se basa en una estructura de datos eficiente conocida como árbol rojo-negro. Este árbol organiza las tareas en función de su tiempo virtual, lo que permite una búsqueda rápida del próximo proceso a ejecutar. Al seleccionar el proceso con el menor tiempo virtual, el CFS asegura una distribución equitativa del tiempo de CPU entre todos los procesos en ejecución.

Además, el CFS incorpora un mecanismo de "sleeper fairness" para garantizar que los procesos que han estado inactivos reciban una oportunidad justa de ejecución cuando vuelven a estar activos. Esto es crucial para evitar la inanición de procesos y garantizar una respuesta ágil del sistema en entornos de múltiples tareas.


## Características

1.  Asignación proporcional de tiempo de CPU: En lugar de asignar valores de prioridad estrictos, el CFS asigna una proporción del tiempo de CPU a cada tarea en función de su valor "nice". Los valores "nice" van de -20 a +19, donde un valor "nice" menor indica una prioridad relativa más alta y una mayor proporción de tiempo de CPU.
    
2.  Latencia objetivo: El CFS utiliza una latencia objetivo, que es un intervalo de tiempo en el que cada tarea ejecutable debería ejecutarse al menos una vez. La asignación de la proporción de tiempo de CPU se realiza en función de esta latencia objetivo.
    
3.  Virtual Run Time: El CFS registra cuánto tiempo ha ejecutado cada tarea mediante el uso de la variable por tarea llamada "vruntime". Esta virtual run time está asociada a un factor de decaimiento basado en la prioridad de la tarea.
    
4.  Árbol Rojo-Negro para tareas ejecutables: En lugar de utilizar una estructura de cola estándar, el CFS utiliza un árbol rojo-negro para organizar las tareas ejecutables, donde la clave de ordenación es el valor de "vruntime".
    
5. Mecanismo de "sleeper fairness": El CFS implementa un mecanismo para garantizar que los procesos inactivos reciban una oportunidad justa de ejecución cuando vuelvan a estar activos, evitando así la inanición de procesos y mejorando la respuesta del sistema en entornos multitarea.

6.  Flexibilidad y adaptabilidad: El diseño del CFS se adapta dinámicamente a las condiciones cambiantes del sistema, garantizando un comportamiento equitativo y predecible incluso en entornos de carga variable.

El proceso de decisión de qué tarea ejecutar a continuación se basa en seleccionar la tarea con el valor de "vruntime" más pequeño. Además, una tarea de mayor prioridad que se vuelve disponible para ejecutarse puede interrumpir una tarea de menor prioridad.

El CFS también implementa el balance de carga, asegurando que cada núcleo de procesamiento tenga una carga aproximadamente equitativa. Utiliza una técnica sofisticada que minimiza la migración de hilos y es consciente de la arquitectura NUMA (Non-Uniform Memory Access).