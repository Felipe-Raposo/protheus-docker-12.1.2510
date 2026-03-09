FROM feliperaposo/protheus-base:24
LABEL maintainer="Felipe Raposo <feliperaposo@gmail.com>"
EXPOSE 1234/tcp
COPY ./root/ /
