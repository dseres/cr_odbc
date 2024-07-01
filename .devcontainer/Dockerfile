FROM crystallang/crystal:1.12 as crystal-base


################################################################################
# Installing packages
################################################################################

RUN apt-get update \
    && apt-get install -y unzip unixodbc unixodbc-dev libaio1 less nano git fish zoxide \
&& apt-get clean autoclean \
&& apt-get autoremove --yes

RUN fish -c 'exit' && \
    echo "zoxide init fish | source" >> $HOME/.config/fish/config.fish
 
################################################################################
#installing oracle driver and configuring odbc sources
################################################################################

ENV ORACLE_HOME="/opt/oracle/instantclient_23_4"
ENV PATH="${PATH}:${ORACLE_HOME}"
ENV LD_LIBRARY_PATH="${ORACLE_HOME}:${LD_LIBRARY_PATH}"

COPY oracle_instantclient/*.zip /opt/oracle/
RUN    unzip -o /opt/oracle/instantclient-basic-linux.x64-23.4.0.24.05.zip     -d /opt/oracle/ \
    && unzip -o /opt/oracle/instantclient-jdbc-linux.x64-23.4.0.24.05.zip      -d /opt/oracle/ \
    && unzip -o /opt/oracle/instantclient-odbc-linux.x64-23.4.0.24.05.zip      -d /opt/oracle/ \
    && unzip -o /opt/oracle/instantclient-sdk-linux.x64-23.4.0.24.05.zip       -d /opt/oracle/ \
    && unzip -o /opt/oracle/instantclient-sqlplus-linux.x64-23.4.0.24.05.zip   -d /opt/oracle/ \
    && unzip -o /opt/oracle/instantclient-tools-linux.x64-23.4.0.24.05.zip     -d /opt/oracle/ \
    && rm -f /opt/oracle/instantclient-*-linux.x64-23.4.0.24.05.zip
COPY oracle_instantclient/TNSNAMES.ORA ${ORACLE_HOME}/network/admin/tnsnames.ora
COPY oracle_instantclient/odbc.ini /etc/
COPY oracle_instantclient/odbcinst.ini /etc/
    
################################################################################
# Devcontainer for VS Code
################################################################################

CMD fish