#!/bin/bash

base() {
	sudo apt-get install -y wget curl man git zsh figlet \
		tmux tree mousepad hexcurse file ruby ruby-dev vim nano p7zip-full \
		djvulibre-bin python3-pip python3-virtualenv libpcap-dev jq powershell \
		firefox-esr xpdf tmuxp man-db exploitdb rpcbind nfs-common feh cmake gridsite-clients
}

network() {
	sudo apt-get install -y netcat-traditional socat rlwrap nmap \
		netdiscover masscan dnsutils onesixtyone braa tcpdump \
		ftp telnet swaks snmpcheck snmpcheck snmp-mibs-downloader \
		iputils-ping iproute2 proxychains sendmail ltrace
}

misc_tools() {
	sudo apt-get install -y \
		csvtool vinetto sqlitebrowser
}

web() {
	sudo apt-get install -y whatweb ffuf sqlmap \
		exiftool default-mysql-client hurl postgresql arjun

}

password() {
	sudo apt-get install -y seclists crunch
}

base
network
misc_tools
web
password

sudo gem install lolcat
