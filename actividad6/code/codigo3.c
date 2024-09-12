
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

// Función para ejecutar en el hilo
void* thread_func(void* arg) {
    printf("Hola desde proceso hijo\n");
    return NULL;
}

int main() {
    pid_t pid;

    pid = fork();

    if (pid == 0) {

        // Segundo fork: solo ejecutado por el proceso hijo
        fork();

        // Crear un hilo en el proceso hijo original
        pthread_t thread;
        if (pthread_create(&thread, NULL, thread_func, NULL) != 0) {
            perror("Error al crear el hilo");
        }

        // Esperar a que el hilo termine
        pthread_join(thread, NULL);

    }
    
    // Tercer fork: ejecutado por todos los procesos (padre y hijos)
    fork();

    // Espera para que los procesos no terminen inmediatamente
    sleep(30);

    return 0;
}
