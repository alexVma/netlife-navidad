# Usa la imagen oficial de Nginx con Alpine como base
FROM nginx:latest


# Copia los archivos estáticos del host al contenedor cuando se inicia el contenedor
COPY ./build/web /usr/share/nginx/html

# Exponer el puerto 80 para las solicitudes HTTP
EXPOSE 80

# Comando por defecto para iniciar Nginx (no es necesario especificarlo explícitamente, ya que es el comando por defecto)
# CMD ["nginx", "-g", "daemon off;"]
