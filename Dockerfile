FROM python:3.9-slim
FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y <packages> && apt-get install -y docker.io
USER jenkins

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]