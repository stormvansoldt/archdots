# Notes for Professor Messer's videos on the Security+ 

## Section 1: Threats, Attacks, and Vulnerabilities
### 1.1 - Malware
	- Virus
		* Malware that can automatically reproduce itself through filesystems, networks, etc.
		* Make sure that antivirus signature files are updated
	- Worms
		* Malware that automatically self-replicates through networks
		* Well-known worms can be filtered by IPS/IDS, but it's not much use if the worm has already infected your system
		* Example: WannaCrypt, which took advantage of a vulnerability in M$ SMB to encrypt infected computers
	- Ransomware
		* Type of malware that encrypts personal files and demands a payment to decrypt them
		* In the past it never actually encrypted anything, but...
	- Crypto-malware
		* Newer generation of ransomware that actually encrypts everything except for the OS files
		* Can be avoided by creating frequent, offline backups
	- Trojan horse
		* A seemingly innocent application that has embedded malware
		* Generally circumvents antivirus unless the specific software signature is already in the signature file
	- Backdoors
		* Non-obvious entryways into a computer system
		* Can be created by malware, or by dumbass software/hardware manufacturers.
	- RAT (Remote Access Tool/Trojan)
		* Installs into the OS as a system service and provides complete control over a machine
		* Usually has a user-friendly client that the attacker uses to control the machine
	- Rootkits
		* Malware that modifies the kernel of the OS to make itself completely invisible to the operating system
	- Keyloggers
		* Logs your keystrokes and sends them to a remote attacker
	- Adware and Spyware
		* Windows OS lol
	- Bots and botnets
		* Infected machines are part of a group that can be used for various things like crypo mining or DDOS attacks
	- Logic bombs
		* Specific type of malware that waits for a specific event to occur before it is activated
		* Usually time bombs, generally deletes data or takes down systems

### 1.2 - Attack Types
	* Phishing
		- Social engineering + spoofing generally delivered by email, IM, etc
		- Generally impersonates login pages to websites
		- ALWAYS LOOK AT THE URL
	* Tailgating
		- Techinque where someone uses someone else to gain access to a restricted area/building
		- Generally performed by dressing as the target employees or following someone behind a badge-restricted door
		- Prevention done by mantraps, badge requirements, and training employees to check people for badges/ID
	* Dumpster diving
		- Literally going through an organization's trash to find information
		- PREVENTION: Shred all your shit
	* Shoulder surfing
		- Looking over someone's shoulder to attempt to view information on their screen or view typed passwords
	* Watering hole attacks
		- A technique where attackers will attempt to attack locations that a target visits instead of the target themselves
	* Social Engineering
		- Non-technical, atatempting to gain information from people instead of machines
		- Usually happens on the phone or email, but it can also happen in person
	* Denial of Service
		- Attacks that take down a service either by overloading the service, or by exploiting a bug causing it to shut down
	* Man in the middle
		- Attacker is sniffing traffic between you and the destination
		- Can happen with TCP/IP, bluetooth, and even USB protocols
		- Can be exploited with ARP and/or DNS poisoning
	* Buffer overflows
		- Overwriting a buffer of memory to spill over into other areas of memory that aren't supposed to be accessed
		- Difficult to find and reproduce consistently, but can be extremely dangerous when done so
	* Data Injection
		- The ability to input arbitrary code into applications
		- SQLi is the most common form of data injection
		- XML injections can inject arbitrary XML to retrieve information
		- All user input should be untrusted, make sure to put proper protections into place
	* Cross-site scripting (XSS)
		- Non-persistent (reflected) XSS
			* Website allows script to run in user input (commonly found in search boxes)
			* Attacker can send link with included XSS to targets and can retrieve cookies and session IDs
		- Persistent (stored) XSS
			* Attacker posts message with included payload to a forum or social network
			* Payload is stored on the server and anyone who loads the web page gets screwed by it
		- Prevention:
			* Client side: disable JavaScript. Good websites shouldn't/don't need it anyways.
			* Server side: I N P U T  V A L I D A T I O N
	* Cross-site request forgery (XSRF/CSRF):
		- Forces an end user to execute unwanted actions on a web application where they are currently authenticated
		- Takes advantage of the trust that a web application has for the user('s browser)
		- Exploitation:
			1. Attacker creates a crafted URL and sends it to a victim who is already logged into a service (ie. banking site)
			2. User clicks the link which sends the malicious request under the privileges of the vicim
	* Privilege escalation:
		- An attacker is able to gain higher level access than they are normally authorized
		- Generally exploited by a bug or design flaw in software
	* DNS Poisoning:
		- Changing information in a DNS server to redirect victims to malicious websites
		- Can also change the /etc/hosts file on a local machine (however this requires root access so...)
	* Domain hijacking:
		- Gaining access to the domain registration to manually change the DNS server used by the domain itself
	* Zero-day attacks:
		- Exploits using vulnerabilities that no one knew about before
	* Replay attacks:
		- Attackers capture network information via different methods
		- This information can then be sent from the attacker to the target server in the context of the victim
		- HTTPS basically makes this obsolete, but stupid people still don't use SSL/TLS on their web servers
	* Typosquatting:
		- Create domains for common typos of popular websites
		- Can be used to deliver malicious JavaScript, generate ad revenue, or even install malware on the victim machine
	* Clickjacking:
		- When a user clicks a button on a webpage with an invisible iframe layered on top of the button
		- Commonly used on mobile devices (specifically Android)
	* Session hijacking:
		- Attackers use a victim's session id to authenticate as that user to a remote service
		- Prevention: Once again, just set up HTTPS or use a VPN when out in public networks
	* Driver manipulation:
		- Embedding malware in system drivers to be invisible to OS processes
		- Examples:
			* Linux kernel modules
			* Windows Compatibility Mode ("shimming" a layer of an OS between an application and the host OS)
	* Spoofing:
		- Type of attack where a device/person pretends to be something that it is not
		- Examples:
			* Email address spoofing
			* Caller ID spoofing
			* MITM attacks - attacker pretends to be both endpoints
			* MAC spoofing - allows access to environments where MAC-based ACLs are implemented
			* IP Address spoofing - used in DNS amplification DDoS attacks
	* Wireless replay attacks:
		- Similar to normal replay attacks, but with additional potential targets
		- Example: Cracking the WEP protocol by utilizing ARP requests to gather IV packets
	* Rogue access points and evil twins:
		- Rogue access points:
			- Unknown AP connected to a network via ethernet cable
			- Prevention: Configure 802.1X (Network Access Control)
		- Evil Twins:
			- Creates a wireless network identical to the target network and attempts to have clients connect to it
			- Utilized as a MItM tool
	* Wireless Jamming:
		- Simple denial of service of radio frequency devices by generating a lot of bad RF signals
	* WPS (Wifi Protected Setup)  Attacks:
		- Just turn this off, there has been a design flaw from the beginning
		- The 8 digit PIN is really 7 digits + a checksum
		- The WPS process validates each half of the PIN (first 4 digits, then second 3 digits)
		- Prevention: Enable lockout and slowdown functions to prevent brute forcing
	* Bluejacking and Bluesnarfing:
		- Bluejacking: Sending unsolicited messages to bluetooth devices
		- Bluesnarfing: Allows someone to access data on a mobile device over Bluetooth
	* RFID and NFC attacks:
		- RFID
			- Data capture for replay attacks
			- Write arbitrary data to the tag
			- DoS
			- Decryption keys are available on Google (lmao)
		- NFC
			- Remote capture
			- DoS
	* Wireless Disassociation attacks:
		- Continually send 802.11 reset frames to a target for DoS
		- Attackers can then sniff the target device's attempts to reconnect to the network to gather network credentials
	* Cryptographic attacks:
		- Attacks on cryptographic methods or implementations
		- Known Plaintext Attack:
			- Attacker has the encrypted data and some of the plaintext and can use this to fully decrypt
		- Rainbow tables:
			- Pre-generated list of password hashes that greatly increases the cracking speed
			- Non-effective against salted hashes
		- Dictionary attacks:
			- Use the most common dictionary words to bruteforce passwords
		- Brute force:
			- Full YOLO, try every possible combination to guess the password
			- Usually best done offline with GPU acceleration
		- Birthday attack:
			- Hash collision: where two separate plaintexts produce the same hash value
		- Downgrade attack:
			- Force a target to use a less-strong cryptographic method

### 1.3 - Threat Actors
	* Threat actor: an entity responsible for an event that has an impact on the safety of another entity
	* Examples:
		- Script kiddies
			- Runs pre-made scripts without any knowledge of how the scripts actually work
			- usually get them from the internet
			- No formal funding, looking for easy exploits
		- Hacktivist:
			- Usually attempts to create social change/has a political agenda
			- Very specific attacks such as DDoS, DoS, website defacing, etc.
		- Organized crime:
			- Professional criminals ultimately motivated by money
			- Generally sophisticated as they can afford the best hardware/software
			- Comprised of multiple people
		- Nation states:
			- Governments (CIA, KGB, etc)
			- Extremely sophisticated as they are funded by the government
			- Example: USA and Israel destroyed nuclear centrifuges with the Stuxnet worm
		- Insiders:
			- Good luck. Security in layers, make sure the internal network is safe against attacks
		- Competitors:
			- Try to bring down your system, harm your reputation, or find industry secrets
			- High level of sophistication

### 1.4 - Penetration Testing
	* Simulating an attack against another device or network
	* Penetration testing is vulnerability testing + actually attemting to exploit the vulnerability
	* Can be contracted to third party companies or by a dedicated security professional in the organization
	* Starts with passive reconnaissance
		- Find infomrmation on social media, online forums, social engineering, the org's website, etc
		- Try to gather as much info without triggering any alarms
	* Active reconnaissance
		- Ping scans, port scans, DNS queries, OS fingerprinting
		- Service scans and version scans
		- This will generally start triggering alarms
	* Exploiting vulns
		- Try to break into the system using the info you found during recon
		- Gain a foothold
		- Pivot
		- Priviledge escalation
		- Password brute-force, DB injection, buffer overflows, etc
		- This will DEFINITELY trigger alarms
	* The process:
		- Initial exploitation (getting into the network)
		- Persistence (set up a backdoor, change/verify user passwords)
		- Pivoting (jumping from device to device once inside the network)
	* Black box testing:
		- Pentesting team has zero knowledge of the systems under attack
	* White box testing:
		- Giving the testers all the information about the systems under attack
	* Grey box testing:
		- Mix of black and white
		- Focus on specific services/systems/networks

### 1.5 - Vulnerability Scanning
	* Unlike a full penetration test, vuln scans generally are not very invasive
	* Simply checking if known vulnerabilities are present in a network/system
	* The goal is to gather as much information as possible
	* Examples:
		- Passive packet capturing
		- Port scans
		- Network mapping
		- OS fingerprinting
		- Service and version enumeration

### 1.6 - Vulnerability Types
	* Race conditions:
		- When two actions happen at the same time
		- Can be very dangerous if not accounted for
	* End-of-life:
		- No vendor support/security updates
		- Example: M$ didn't update EOL systems to protect against SMB vuln, and because of that we got WannaCrypt. Great job...
	* Embedded systems:
		- IoT devices
		- Running outdated software, rarely/never updates
		- "The S in 'IoT' stands for Security"
		- Linksys and D-Link are the most egregious examples of this
	* Improper input handling:
		- ALWAYS CHECK ANYTHING THE USER CAN INPUT
		- Causes code injections, SQL injections, buffer overflows, etc
	* Improper error handling:
		- Error messages should not provide ANY detailed information to the end-user about the interal systems
		- Turn off your stupid SQL and PHP errors holy crap it's not that hard


# Section 2 - Technologies and Tools
### 2.1 - Security Components
	* Firewalls:
		- Controls the flow of inbound and outbound network content
		- Network-based:
			- Traditionally OSI Layer 4 (transport layer), but nowadays some can filter up to OSI Layer 7 (application)
			- Can make good VPN concentrators by encrypting traffic
			- Most firewalls can be layer 3 devices (routers)
		- Stateless:
			- Does not keep track of traffic flows
			- Each packet is individually examined and does not remember history
			- Traffic needs to be allowed for both outbound and the resulting inbound connection (eg. HTTP connections)
		- Stateful:
			- Remembers the "state" of the session
			- Only requires one rule, the firewall then remembers any active connection and will forward that traffic without an additional inbound rule
		- Application-based:
			- Watches traffic at the packet level and examines the data in each of those packets
			- In network-based firewalls for SQL, Twitter, YT, etc.
			- IPS use this to allow or disallow traffic based on the application
		- Access Control Lists (ACLs):
			- Allow or disallow traffic based on groupings of categories, or tuples
			- Follows a logical path, usually top to bottom of the list
	* VPN Concentrators:
		- Creates a VPN to use an encrypted tunnel from a device to an endpoint
		- Device that is specifically designed to encrypt and decrypt network traffic
		- Commonly integrated with hardware firewalls and sits between an internal network and the internet
		- (INTERNAL NETWORK) ---- (VPN CONCENTRATOR) ==== [ENCRYPTED TUNNEL OVER INTERNET] ==== (ENDPOINT DEVICE)
		- Can also be used with another VPN concentrator at another site to create site-to-site encrypted communication
		- IPSec allows Layer 3 encryption which also allows for packet signing to prevent replay attacks
			- AH (Authentication Header)
			- ESP (Encapsulation Security Payload)
	* IDS:
		- Can be network-based or host-based
		- If it identifies a potential exploit, it will inform you by sending an alert
	* IPS:
		- Same as IDS but it actually prevents exploits from happening
		- Passive monitoring:
			- The device gets a copy of the packet and sends a TCP RST frame to both source and destination
			- Occurs after the fact since it is not sitting between the network and the internet
		- Inline monitoring:
			- The IPS sits directly between the internet and the network
			- Allows the IPS to drop packets before they get to their destination
	* Routers:
		- Routes traffic between IP subnets
		- Layer 3 devices (Network) - Makes routing decisions based on IP addresses
		- Can use ACLs to allow or deny traffic, NAT, or QoS
		- Anti-spoofing is needed to prevent attackers from using someone else's IP address:
			- Example is to block RFC 1918 addresses from routing to/from the internet
			- Enable Reverse Path Forwarding (RPF) - The response to an inbound packet should return the same way. Otherwise, drop the packet
	* Switches:
		- Briding done in hardware (OSI Layer 2: Data link)
		- Create switch port security by creating separate VLANs as the inside of the network is relatively insecure
		- Network Access Control (NAC):
			- IEEE 802.1X
			- Authentication is needed to access interfaces on the switch
			- Administratively disable unused ports to prevent rogue attackers
			- Duplicate MAC address checking to prevent spoofing
		- Loop prevention:
			- Since Layer 2 devices don't check packets, two switches could send packets back and forth forever
			- Spanning Tree Protocol:
				- IEEE 802.1D
				- Created to prevent loops in switched networks
				- Automatically configures itself as long as it's enabled, even when there are changes to the networks
		- Flood guard:
			- Prevents DoS from providing a ton of MAC addresses to a switch
			- Admin can configure a maximum number of source MAC addresses on an interface
		- Layer 3 switches:
			- Adds L3 functionality to a physical switch
	* Proxies:
		- Device that sits between users and the internet to filter content
		- Can perform caching, URL filtering, content scanning, etc
		- Some need to be manually configured, some are invisible/transparent
		- Example: NAT:
			- 
