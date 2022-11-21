FROM python:3.9.15

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim curl gnupg2 apt-transport-https ca-certificates libsasl2-dev libldap2-dev libssl-dev

# MSSQL Server client
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev
ENV PATH="$PATH:/opt/mssql-tools/bin"

RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1.0/g' /etc/ssl/openssl.cnf

CMD bash
