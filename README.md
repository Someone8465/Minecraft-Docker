</head>
<body>
  <header>
    <h1>Minecraft Server Setup</h1>
    <p>Docker + Domain Configuration Guide</p>
  </header>

  <main>
    <section>
      <h2>Before You Begin</h2>
      <ul>
        <li>Install <a href="https://www.docker.com/products/docker-desktop/" target="_blank">Docker Desktop</a> if you don’t already have it.</li>
        <li>Decide if your server will be <strong>local only</strong> or <strong>public with a domain</strong>.</li>
        <li>A domain makes connecting easier. Providers like <strong>Porkbun</strong> sell domains for $1–10/year.</li>
      </ul>
    </section>
    <section>
      <h2>Part 1: Base Server Setup</h2>
      <ol>
        <li><strong>Get the files:</strong> Download the preferred version from <a href="https://github.com/Someone8465/Minecraft-Docker/releases">Releases</a> and then extract the files to your preferred storage location.</li>
        <li><strong>Accept the EULA:</strong>
          <ul>
            <li>Navigate to <code>./minecraft-docker/server/</code></li>
            <li>Open <code>eula.txt</code></li>
            <li>Change <code>eula=false</code> → <code>eula=true</code></li>
          </ul>
        </li>
        <li><strong>Configure the server:</strong> Edit <code>server.properties</code>. By default, whitelist is enabled (recommended).</li>
        <li><strong>Choose server version:</strong> Replace <code>server.jar</code> in <code>./minecraft-docker/build/</code> to use another version (e.g., Paper).</li>
        <li><strong>Adjust memory (optional):</strong>
          <ul>
            <li>Edit <code>./minecraft-docker/Dockerfile</code></li>
            <li>Key arguments:
              <ul>
                <li><code>-Xms2G</code> → Minimum RAM</li>
                <li><code>-Xmx8G</code> → Maximum RAM</li>
              </ul>
            </li>
          </ul>
        </li>
        <li><strong>Start the server:</strong>
          <pre><code>docker compose up</code></pre>
        </li>
        <li><strong>Whitelist players:</strong>
          <pre><code>docker attach minecraft
whitelist add &lt;minecraft_username&gt;</code></pre>
        </li>
        <li><strong>Test locally:</strong> Launch Minecraft and connect to <code>localhost</code>.</li>
      </ol>
    </section>
    <section>
      <h2>Part 2: Domain + Port Forwarding (Optional)</h2>
      <ol>
        <li><strong>Find your public IP:</strong> Visit <a href="https://whatsmyip.com" target="_blank">whatsmyip.com</a>.</li>
        <li><strong>Set up DNS:</strong>
          <ul>
            <li>Create an <strong>A record</strong> (e.g., <code>play.yourdomain.com</code>)</li>
            <li>Point it to your public IP</li>
            <li>Use port <code>25565</code></li>
          </ul>
        </li>
        <li><strong>Allow firewall traffic (Windows):</strong>
          <ul>
            <li>Open <em>Windows Defender Firewall</em></li>
            <li>Create a new <em>Inbound Rule</em> for TCP port <code>25565</code></li>
          </ul>
        </li>
        <li><strong>Port forward on your router:</strong> Forward TCP <code>25565</code> to your server’s local IP.</li>
        <li><strong>Test external access:</strong>
          <ul>
            <li>Other computers connect with <code>play.yourdomain.com</code></li>
            <li>Host machine connects with <code>localhost</code></li>
          </ul>
        </li>
      </ol>
    </section>
    <div class="note">
      ✅ At this point, your server should be running and accessible both locally and (if configured) via your domain.
    </div>
  </main>
  <footer>
    <p>Minecraft Server Setup Guide · Powered by Docker</p>
  </footer>
</body>
</html>
