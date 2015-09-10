FROM ubuntu:latest

RUN apt-get update && apt-get install -y --force-yes apache2
RUN apt-get install -y --force-yes libapache2-mod-authnz-external

# Add the required modules that are missing from standard build
RUN a2enmod actions ;\
    a2enmod authnz_ldap ;\
    a2enmod authnz_external ;\
    a2enmod dav ;\
    a2enmod dav_fs ;\
    a2enmod ldap ;\
    a2enmod setenvif ;\
    a2enmod ssl

# Define default command
ENTRYPOINT  ["apache2ctl", "-D", "FOREGROUND"]
