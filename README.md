# SQL Server Client on Docker

This Docker image is based on [python:3.9.15](https://hub.docker.com/layers/library/python/3.9.15/images/sha256-2a8698e36f267e998d72fb2a7182a0885c119bfa686995318d7fae5a2e0fa35a?context=explore) but it can work on any Debian like Linux distribution.

Case you need another base image, just replace *FROM* statement on Dockerfile for another image Debian based.

# Creating the image

```
docker build -t sql-server-client:latest .
```

# Running

```
docker run --name sql-server-client -it sql-server-client:latest bash
```

# Connecting to SQL Server database

Once inside the container, you can execute:

```
sqlcmd -S ip_addres -d dbname -U username -P password;
SELECT COUNT(*) FROM your_table;
go <enter>
```
