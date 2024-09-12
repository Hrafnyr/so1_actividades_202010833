
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(){
    
    //Crear proceso hijo
    pid_t pid_ejemplo = fork();

    if(pid_ejemplo > 0){
        
        //Proceso padre: Dormir para simular proceso zombie
        sleep(60);

    } else if (pid_ejemplo == 0){

        //Proceso hijo: termina inmediatamente
        exit(0);
    
    } else {
        //Manejo de errores
        perror(">> Error al crear Fork");
    }

    return 0;
};