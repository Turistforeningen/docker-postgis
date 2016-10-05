FROM mdillon/postgis:latest

# Add locale nb_NO.utf8
RUN localedef -i nb_NO -c -f UTF-8 -A /usr/share/locale/locale.alias nb_NO.UTF-8
ENV LANG nb_NO.utf8
