@echo off
echo Stopping existing Docker container: famdb
docker stop famdb

echo Removing existing Docker container: famdb
docker rm famdb

echo Building Docker image: famdb:latest
docker build -t famdb:latest .

echo Running Docker container: famdb
docker run -d -p 5432:5432 --name famdb famdb:latest

echo All commands executed successfully.
pause