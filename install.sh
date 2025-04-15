#!/bin/bash

echo "=========================================="
echo "     KADEZ-406 Pentest Tools Installer    "
echo "=========================================="

# Buat folder buat tools
mkdir -p ~/pentest-tools
cd ~/pentest-tools || exit

# Update sistem
sudo apt update && sudo apt upgrade -y

# Install base dependencies
sudo apt install -y golang git python3-pip curl wget nmap netcat ruby php unzip build-essential jq

# Install subfinder
echo "[*] Installing Subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
ln -s ~/go/bin/subfinder /usr/local/bin/subfinder

# Install httpx
echo "[*] Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
ln -s ~/go/bin/httpx /usr/local/bin/httpx

# Install nuclei
echo "[*] Installing Nuclei..."
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
ln -s ~/go/bin/nuclei /usr/local/bin/nuclei

# Install whatweb
echo "[*] Installing WhatWeb..."
sudo apt install -y whatweb

# Install wafw00f
echo "[*] Installing wafw00f..."
sudo pip3 install wafw00f

# Install waybackurls
echo "[*] Installing waybackurls..."
go install github.com/tomnomnom/waybackurls@latest
ln -s ~/go/bin/waybackurls /usr/local/bin/waybackurls

# Install dnsrecon
echo "[*] Installing dnsrecon..."
git clone https://github.com/darkoperator/dnsrecon.git
cd dnsrecon || exit
sudo pip3 install -r requirements.txt
ln -s "$(pwd)/dnsrecon.py" /usr/local/bin/dnsrecon
cd ..

# Install nikto
echo "[*] Installing Nikto..."
git clone https://github.com/sullo/nikto.git
cd nikto/program || exit
ln -s "$(pwd)/nikto.pl" /usr/local/bin/nikto
cd ../../

# Install paramspider
echo "[*] Installing ParamSpider..."
git clone https://github.com/devanshbatham/ParamSpider.git
cd ParamSpider || exit
pip3 install -r requirements.txt
cd ..

# Install feroxbuster
echo "[*] Installing Feroxbuster..."
wget https://github.com/epi052/feroxbuster/releases/latest/download/feroxbuster_amd64.deb
sudo dpkg -i feroxbuster_amd64.deb

# Install dalfox
echo "[*] Installing Dalfox..."
go install github.com/hahwul/dalfox/v2@latest
ln -s ~/go/bin/dalfox /usr/local/bin/dalfox

# Install commix
echo "[*] Installing Commix..."
git clone https://github.com/commixproject/commix.git

# Install sqlmap
echo "[*] Installing SQLMap..."
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git

# Install linpeas
echo "[*] Downloading LinPEAS..."
mkdir linpeas && cd linpeas || exit
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
chmod +x linpeas.sh
cd ..

# Install SecretFinder
echo "[*] Installing SecretFinder..."
git clone https://github.com/m4ll0k/SecretFinder.git
cd SecretFinder || exit
pip3 install -r requirements.txt
cd ..

# Install proxychains
echo "[*] Installing ProxyChains..."
sudo apt install -y proxychains

# Install macchanger
echo "[*] Installing macchanger..."
sudo apt install -y macchanger

echo ""
echo "=========================================="
echo "  Semua tools udah ke-install di ~/pentest-tools"
echo "  Jalankan tools via CLI atau bikin menu CLI sendiri"
echo "=========================================="
