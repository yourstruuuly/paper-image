Extremely basic container image for the Minecraft [Paper server software](https://papermc.io/)

## Example compose.yml
```yml
services:
  minecraft:
    container_name: minecraft
    image: <name for this container image after you built it or whatever>
    restart: unless-stopped
    network_mode: "host"
    volumes:
      - ./mc-data:/home/paper/gamedata
    environment:
      PAPER_DOWNLOAD: https://link-to-a-direct-download.com/for/paper-VERSION-BUILD.jar
```
Mount a volume at /home/paper/gamedata to easily edit configuration for your server.
`PAPER_DOWNLOAD` env var must be set unless you already have a file called `paper.jar` in the game data directory.
Latest stable release download URL as of writing this is:
`https://fill-data.papermc.io/v1/objects/25eb85bd8415195ce4bc188e1939e0c7cef77fb51d26d4e766407ee922561097/paper-1.21.11-130.jar`
which would be a suitable value for the env var
There are no other environment variables, prefer configuring via paper's own files.
