## Docker container for PostgreSQL 9.6 on CentOS 7
forked from https://github.com/CentOS/CentOS-Dockerfiles/tree/master/postgres/centos7
and configured to 9.6

# To build 
```docker build --rm -t <yourname/postgresql .```

# To run
docker run --name=postgresql -d -p 5432:5432 <yourname>/postgresql

