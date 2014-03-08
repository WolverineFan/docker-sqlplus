FROM centos

RUN yum install -y libaio
ADD oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
ADD oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm

RUN rpm -ivh oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm

RUN echo "export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib" >> ~/.bashrc
RUN echo "export PATH=$PATH:/usr/lib/oracle/11.2/client64/bin" >> ~/.bashrc

CMD source ~/.bashrc; echo "sqlplus $CSTR"; sqlplus $CSTR
