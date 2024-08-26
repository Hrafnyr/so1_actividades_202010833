Universidad de San Carlos de Guatemala 

Facultad de Ingeniería

Escuela de Ciencias y Sistemas

Sistemas Operativos 1


# ACTIVIDAD #5
## TIPOS DE KERNEL

Estos sistemas tienen un núcleo grande y complejo, que engloba los servicios del sistema. Cualquier cambio a realizar al servicio requiere la recopilación del núcleo y el reinicio del sistema para aplicar nuevos cambios.

- **Micronúcleos:**
  Son núcleos de pequeño tamaño compilados con las necesidades más básicas del sistema operativo. El resto de las funcionalidades se añaden mediante la adición de módulos externos.

  **Pros del micronúcleo:**
  - Portabilidad
  - Pequeña huella de memoria
  - Seguridad
  - Control del Micronúcleo
  - El hardware es más abstracto a través de controladores
  - Hardware puede reaccionar más lento porque los controladores están en modo usuario
  - Los procesos tienen que esperar en una cola para obtener información
  - Los procesos no pueden tener acceso a otros procesos sin tener que esperar.

- **Núcleos Híbridos:**
  Es una arquitectura basada en la combinación de microkernel y núcleo monolítico. Estos se utilizan dentro de las computadoras mediante los sistemas operativos. A diferencia de los núcleos monolíticos tradicionales, los controladores y extensiones al sistema operativo se pueden cargar y descargar fácilmente como módulos, mientras el sistema continúa funcionando sin interrupciones. Nota: La mayoría de los sistemas operativos modernos tienen un núcleo híbrido.

- **Exonúcleos:**
  Son sistemas operativos verticalmente estructurados, representando una aproximación radical. La idea es permitir que el desarrollador tome decisiones relativas al rendimiento de hardware. Son extremadamente pequeños, limitando la funcionalidad, la protección y el multiplexado de los recursos.

---

## USER VS KERNEL MODE

El procesador de una computadora que ejecuta Windows opera en dos modos diferentes: modo de usuario y modo kernel. Las aplicaciones operan en modo de usuario, mientras que los componentes principales del sistema operativo funcionan en modo kernel.

- **Modo de usuario:**
  Cuando inicias una aplicación en modo de usuario, Windows crea un proceso para ella. Este proceso proporciona a la aplicación un espacio de direcciones virtuales privado y una tabla de identificadores privada. Dado que el espacio de direcciones virtuales de cada aplicación es privado, una aplicación no puede modificar los datos de otra aplicación.

- **Modo kernel:**
  Todo el código que se ejecuta en modo kernel comparte un único espacio de direcciones virtuales. Como resultado, un controlador en modo kernel no está aislado de otros controladores o del sistema operativo. Si un controlador en modo kernel escribe por error en una dirección virtual incorrecta, podría comprometer datos pertenecientes al sistema operativo o a otro controlador.

---

## INTERRUPTIONS VS TRAPS

- **¿Qué es traps?**
  El programa de usuario produce traps para invocar la funcionalidad del sistema operativo. Por ejemplo, si la aplicación del usuario requiere imprimir algo en la pantalla, se activaría una trap y el sistema operativo escribiría los datos en la pantalla. Una trap es una interruption producida por software que puede ser causada por varios factores, incluido un error en la instrucción, como la división por cero o el acceso ilegal a la memoria.

- **Mecanismo de traps en el sistema operativo:**
  El programa de usuario del CPU suele utilizar llamadas a la biblioteca para realizar llamadas al sistema. El trabajo de la verificación de rutina de la biblioteca es validar los parámetros del programa, crear una estructura de datos para transferir los argumentos de la aplicación al núcleo del sistema operativo y luego ejecutar instrucciones especiales conocidas como traps o interruptions de software.

- **¿Qué es interruptions?**
  Interruptions son señales emitidas por software o hardware cuando un proceso o evento requiere atención inmediata. Debido a que tanto el hardware como el software generan estas señales, se les denomina hardware y software interruptions.

- **Mecanismo de interruptions en el sistema operativo:**
  En un programa se ejecutan varias instrucciones, y el tiempo que tarda un programa en ejecutar una instrucción se denomina ciclo de instrucción. Los dispositivos de E/S o programas de usuario pueden generar interruptions mientras el CPU ejecuta las instrucciones del programa.

- **Principales diferencias entre traps e interruptions:**
  - Traps es una señal generada por un programa de usuario que indica al sistema operativo que realice alguna funcionalidad inmediatamente. Interruptions es una señal al CPU emitida por hardware que indica un evento que requiere atención inmediata.
  - Traps también activa la funcionalidad del sistema operativo y otorga control al controlador de traps, mientras que una interruptions obliga al CPU a activar una rutina de manejo de interruptions específica.

---

## Comparación directa entre traps e interruptions

| Traps                                        | Interruptions                                      |
| -------------------------------------------- | -------------------------------------------------- |
| Señal generada por un programa de usuario que indica al sistema operativo que realice alguna funcionalidad inmediatamente. | Señal al CPU emitida por hardware que indica un evento que requiere atención inmediata. |
| Es un proceso sincrónico.                    | Es un proceso asincrónico.                          |
| Todas las traps son interrumpidas.           | No todas las interruptions son traps.              |
| Puede ocurrir solo desde los dispositivos de software. | Puede ocurrir desde los dispositivos de hardware y software. |
| Una instrucción del programa de usuario lo genera. | Los dispositivos de hardware lo generan.           |
| También se conoce como interruptions de software. | También se conoce como interruptions de hardware. |
| Ejecuta la funcionalidad específica en el sistema operativo y otorga control al controlador de traps. | Obliga al CPU a activar una rutina de manejo de interruptions específica. |

