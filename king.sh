<html>
<head>
  <title>Termux Hacking Tool</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap" rel="stylesheet" />
  <style>
    body {
      font-family: 'Roboto Mono', monospace;
    }
  </style>
</head>
<body class="bg-gray-900 text-green-400 min-h-screen flex flex-col">
  <header class="bg-gray-800 p-4 flex items-center justify-between">
    <h1 class="text-2xl font-bold"><i class="fas fa-terminal mr-2"></i>Termux Hacking Tool</h1>
  </header>

  <main class="flex-grow p-4 max-w-4xl mx-auto w-full flex flex-col">
    <section class="mb-6">
      <label for="commandInput" class="block mb-2 text-green-300 font-semibold">Enter Command:</label>
      <input id="commandInput" type="text" placeholder="e.g. nmap -sV 192.168.1.1" class="w-full p-3 rounded bg-gray-800 text-green-400 focus:outline-none focus:ring-2 focus:ring-green-500" />
    </section>

    <section class="mb-6">
      <button id="runBtn" class="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-3 rounded transition duration-300">
        <i class="fas fa-play mr-2"></i>Run Command
      </button>
    </section>

    <section>
      <label class="block mb-2 text-green-300 font-semibold">Output:</label>
      <pre id="output" class="bg-gray-800 p-4 rounded h-64 overflow-y-auto whitespace-pre-wrap"></pre>
    </section>
  </main>

  <footer class="bg-gray-800 p-4 text-center text-green-500 text-sm">
    &copy; 2024 Termux Hacking Tool - For educational purposes only.
  </footer>

  <script>
    const runBtn = document.getElementById('runBtn');
    const output = document.getElementById('output');
    const commandInput = document.getElementById('commandInput');

    // Simulated command outputs for demonstration
    const commandOutputs = {
      'nmap -sV 192.168.1.1': `Starting Nmap 7.80 ( https://nmap.org ) at 2024-06-01 12:00
Nmap scan report for 192.168.1.1
Host is up (0.0010s latency).
Not shown: 997 closed ports
PORT    STATE SERVICE VERSION
22/tcp  open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
80/tcp  open  http    Apache httpd 2.4.29 ((Ubuntu))
443/tcp open  ssl/http Apache httpd 2.4.29 ((Ubuntu))

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 3.45 seconds`,

      'whoami': 'root',

      'ifconfig': `eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.100  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::a00:27ff:fe4e:66a1  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:4e:66:a1  txqueuelen 1000  (Ethernet)
        RX packets 1000  bytes 123456 (120.5 KiB)
        TX packets 800  bytes 98765 (96.4 KiB)`,

      'ls': `Desktop  Documents  Downloads  Music  Pictures  Videos`,

      'ping 8.8.8.8': `PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=117 time=14.2 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=117 time=14.0 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=117 time=13.9 ms

--- 8.8.8.8 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 13.9/14.0/14.2/0.1 ms`
    };

    runBtn.addEventListener('click', () => {
      const cmd = commandInput.value.trim();
      if (!cmd) {
        output.textContent = 'Please enter a command.';
        return;
      }

      output.textContent = 'Running command: ' + cmd + '\n\n';

      // Simulate delay for command execution
      setTimeout(() => {
        if (commandOutputs[cmd]) {
          output.textContent += commandOutputs[cmd];
        } else {
          output.textContent += `bash: ${cmd}: command not found`;
        }
      }, 1000);
    });

    // Allow pressing Enter to run command
    commandInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        runBtn.click();
      }
    });
  </script>
</body>
</html>
