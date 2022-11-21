FROM python:3.9.15

# Install necessary packages
RUN apt-get update --no-cache && \
    apt-get upgrade -y && \
    apt-get install -y vim curl gnupg2 apt-transport-https ca-certificates libsasl2-dev libldap2-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Add Microsoft's GPG key
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Add Microsoft's repository
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

# Install MSSQL Server client
RUN apt-get update --no-cache && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev && \
    rm -rf /var/lib/apt/lists/*

# Add MSSQL tools to PATH
ENV PATH="$PATH:/opt/mssql-tools/bin"

# Modify OpenSSL configuration
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1.0/g' /etc/ssl/openssl.cnf

# Run bash when the container launches
CMD ["bash"]
