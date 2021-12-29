### **SQL+UPDATER**

Project to run liquibase

#### 1. Build image
```bash
docker build -t sebczu/personal:sql-updater-0.0.1 service
```

#### 2. Docker-compose run container
```bash
docker-compose -f docker/docker-compose.yml up
```