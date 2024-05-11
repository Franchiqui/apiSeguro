# Usa la imagen base de tiangolo/uvicorn-gunicorn-fastapi para Python 3.12
FROM python:3

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PYTHONUNBUFFERED=1

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de requerimientos
COPY requirements.txt .

RUN python -m venv venv

RUN /bin/bash -c "opt-env\Scripts\activate.bat"

# Instalar las dependencias
RUN pip install -r requirements.txt

# Copiar todo el contenido del directorio actual al directorio de trabajo del contenedor
COPY . .

# Exponer el puerto 8000 en el contenedor
EXPOSE 8000

# Comando para ejecutar la aplicación utilizando uvicorn
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]