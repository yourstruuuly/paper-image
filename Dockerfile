FROM docker.io/alpine

ENV GAMEUSER="paper"
ENV GAMEDIR="/home/$GAMEUSER/gamedata"
ENV DLURL="https://fill-data.papermc.io/v1/objects/25eb85bd8415195ce4bc188e1939e0c7cef77fb51d26d4e766407ee922561097/paper-1.21.11-130.jar"

ENV PAPER_HOST="127.0.0.1"
ENV PAPER_PORT=25565

RUN apk update
RUN apk add openjdk25-jre
RUN adduser -D "$GAMEUSER"
USER "$GAMEUSER"
WORKDIR "/home/$GAMEUSER"
RUN mkdir -p gamedata
COPY "entry.sh" "entry.sh"
ENTRYPOINT ["sh", "entry.sh"]
