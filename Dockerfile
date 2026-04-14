FROM docker.io/alpine

ENV GAMEUSER="paper"
ENV GAMEDIR="/home/$GAMEUSER/gamedata"

ENV PAPER_DOWNLOAD=""

RUN apk update
RUN apk add openjdk25-jre
RUN adduser -D "$GAMEUSER"
USER "$GAMEUSER"
WORKDIR "/home/$GAMEUSER"
RUN mkdir -p gamedata
COPY "entry.sh" "entry.sh"
ENTRYPOINT ["sh", "entry.sh"]
