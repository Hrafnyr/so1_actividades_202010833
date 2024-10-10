
Universidad de San Carlos de Guatemala

Facultad de Ingeniería

Escuela de Ciencias y Sistemas

Sistemas Operativos 1

# ACTIVIDAD #8

##  Primeros pasos con K8s

Instalación de Kubernetes en un Ambiente Local: 

### 1. Usando Minikube 1. 

**Instalar Minikube**: Descarga e instala Minikube desde su [descarga](https://minikube.sigs.k8s.io/docs/start/).

 **Iniciar Minikube**: Ejecuta el comando para iniciar el cluster de Minikube:

	 bash minikube start
	 
**Verificar la instalación**: Asegúrarse de que Minikube esté funcionando correctamente:

`kubectl get nodes`

### 2. Desplegar un Web Server (Nginx) en el Cluster de Kubernetes

1.  **Crear el deployment de Nginx**: Utilizar `kubectl` para desplegar un servidor Nginx:
      
    `kubectl create deployment nginx --image=nginx` 
    
2.  **Exponer el deployment**: Crea un servicio para exponer el contenedor Nginx en un puerto accesible:
        
    `kubectl expose deployment nginx --type=NodePort --port=80` 
    
3.  **Obtener la URL para acceder a Nginx**:

	Si se está utilizando Minikube:
        
        `minikube service nginx --url` 
                

## 3. ¿Existen nodos masters y workers en un ambiente local de Kubernetes?

En un ambiente local de Kubernetes, como Minikube, Kind o Docker Desktop, no existen nodos masters y workers separados como en un cluster de producción típico. Estos entornos locales ejecutan un solo nodo que actúa tanto como master como worker. En Minikube, por ejemplo, este único nodo contiene los componentes del plano de control (control plane) y al mismo tiempo ejecuta los workloads. Aunque conceptualmente se emula la arquitectura de un cluster distribuido, todo está contenido en un solo nodo para facilitar el desarrollo local.