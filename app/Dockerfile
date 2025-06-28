FROM python:3.11.12-slim
WORKDIR /app
RUN apt-get update && apt-get install -y \
    gcc default-libmysqlclient-dev pkg-config build-essential \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# docker build -t samir3112/hotel-management:latest .
#  docker push samir3112/hotel-management:latest