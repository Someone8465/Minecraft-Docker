# Minecraft Server Setup (Docker + Domain)

This guide currently covers setting up a vanilla Minecraft server (v1.21.8) with Docker and a custom domain. Future versions will include step-by-step instructions for plugins, other server sharing options, and further reccomendations.
## Before You Begin
Install Docker Desktop if you don’t already have it.
Decide whether you’ll be running local only (LAN play) or public with a domain.
You’ll need a domain name if you want friends to connect without using your IP directly. Services like Porkbun sell domains for as little as $1-10/year. (Personally my domain costs about $5/year)
## Part 1: Base Server Setup
1. Get the files
     - Download the preferred version from [Releases](https://github.com/Someone8465/Minecraft-Docker/releases) and then extract the files to your preferred storage location.
2. Accept the EULA
     - Go to ./minecraft-docker/server/
     - Open eula.txt
     - Read the Minecraft End User License Agreement
     - Change eula=false → eula=true
3. Configure the server
     - Open server.properties in ./minecraft-docker/server/
     - Edit settings as desired.
     - Note that by default, only the whitelist is enabled (recommended for private servers or in general if you dont have much knowledge on or dont want to mess with anticheats or other security measures).
4. Choose the server version
     - By default, the server uses vanilla 1.21.8.
     - To change versions or use plugins (e.g., Paper), replace the server.jar in ./minecraft-docker/build/.
5. Adjust memory usage (or other java arguments)
     - [Find out how much RAM your server will need](www.craftmc.net/tools/minecraft-server-calculator)
     - Open ./minecraft-docker/Dockerfile
     - Look for the Java arguments: (Beginners should only adjust these two values)
          - Xms2G → Minimum RAM (default 2 GB)
          - Xmx8G → Maximum RAM (default 8 GB, which is super overkill for the vast majority of users)
7. Start the server
     - Open a terminal in the ./minecraft-docker/ folder
     - Run: docker compose up
8. Whitelist players
     - Attach to the server to the terminal with: docker attach minecraft
     - When the console is ready, add players: whitelist add <minecraft_username>
9. Test locally
     - Launch Minecraft (matching the server version)
     - Add a server with the address: localhost
## Part 2: Domain + Port Forwarding (Optional)
Do this if you want others to connect without using your public IP directly:
1. Find your public IP
     - Visit whatsmyip.com or similar.
2. Set up DNS
     - In your domain registrar’s DNS settings, create an A record:
     - Example: play.yourdomain.com
     - Points to: your public IP
     - Port: 25565 (default Minecraft port)
3. Configure your firewall (Windows example)
     - Open Windows Defender Firewall → Advanced Settings
     - Create a new Inbound Rule to allow TCP port 25565.
4. Port forward on your router
     - Forward TCP 25565 to your server machine’s local IP.
     - This step varies by router; check your router’s admin page.
5. Test external access
     - From another computer, connect in Minecraft using your domain: play.yourdomain.com
     - Note that from the host machine, you’ll still connect with: localhost
