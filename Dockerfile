# Docker Postgres Tutorial
# https://www.andreagrandi.it/2015/02/21/how-to-create-a-docker-image-for-postgresql-and-persist-data/

FROM centos:latest
LABEL maitainer = Burenin Aleksei <dexalex@gmail.com>

RUN rpm -Uvh https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm

RUN yum update -y ; yum -y install postgresql96-server postgresql96-devel postgresql96-contrib ; yum clean all


ENV PATH /usr/pgsql-9.6/bin:/:$PATH
ENV PGDATA /var/lib/pgsql/data

ADD ./postgresql-setup /usr/bin/postgresql-setup
#ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start_postgres.sh /start_postgres.sh

RUN chmod +x /usr/bin/postgresql-setup
RUN chmod +x /start_postgres.sh

RUN /usr/bin/postgresql-setup initdb

#ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf
#RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf

RUN echo "host    all             all             all               trust" >> /var/lib/pgsql/data/pg_hba.conf

VOLUME ["/var/lib/pgsql"]

EXPOSE 5432

LABEL descr = Create user and cnfigure pg_hba.conf

   #RUN  ./start_postgres.sh
   #ENTRYPOINT ["/start_postgres.sh"]
   #CMD ["/bin/bash"]

   CMD ["/bin/bash", "/start_postgres.sh"]
   #CMD ["postgres"]
   #USER postgres
   #CMD ["su", "postgres","-c","'/usr/pgsql-9.6/bin/postgres -D /var/lib/pgsql/data'"]



