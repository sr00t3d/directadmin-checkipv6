# DirectAdmin IPv6 Checker 🔍

Readme: [BR](README-ptbr.md)

![License](https://img.shields.io/github/license/sr00t3d/directadmin-checkipv6)
![Shell Script](https://img.shields.io/badge/Shell-script-green)

<img width="700" src="da-checkipv6-cover.webp" />

This script automates the verification of **AAAA (IPv6)** records for all domains hosted on a DirectAdmin server. It generates a formatted report indicating which domains are already operating with the new IP protocol version.

## 📋 Features

- Scans all users and domains configured in DirectAdmin.
- Performs real-time DNS queries (via `dig`).
- Generates a clean tabular report in `/var/www/html/ipv6-domains.txt`.
- Quickly identifies which domains have or do not have IPv6 pointing.

🚀 How to use

1. **Download the file to the server:**

```bash
curl -O https://raw.githubusercontent.com/sr00t3d/directadmin-checkipv6/refs/heads/main/da-checkipv6.sh
```

2. **Give execution permission:**

```bash
chmod +x da-checkipv6.sh
```

3. **Run the script:**

```bash
./da-checkipv6.sh
```

4. Result View

After execution, you can view the report directly through the terminal or via a browser (if Apache/Nginx is running):

```bash
cat /var/www/html/ipv6-domains.txt
```

📊 Example Output

```bash

./da-checkipv6.sh 
Starting domain verification...
List generated at /var/www/html/ipv6-domains.txt

Domain                                   | AAAA                                    | Using IPv6?
-----------------------------------------------------------------------------------------------
domain1.com.br                           | -                                       | no        
domain2.adv.br                           | -                                       | no        
domain3.org.br                           | -                                       | no        
domain4.com                              | 1446:4700:130:436c:6f75:6466:6c61:7265  | yes     
```

> [!WARNING]
> The script requires read permission in the DirectAdmin directories (/usr/local/directadmin/data/users/), therefore running it as the root user is recommended.

## ⚠️ Legal Notice

> [!WARNING]
> This software is provided "as is". Always ensure you have explicit permission before running. The author is not responsible for any misuse, legal consequences, or data impact caused by this tool.

## 📚 Detailed Tutorial

For a complete, step-by-step guide, check out my full article:

👉 [**Check Domains Ipv6 on DirectAdmin**](https://perciocastelo.com.br/blog/check-domains-ipv6-on-directAdmin.html)

## License 📄

This project is licensed under the **GNU General Public License v3.0**. See the [LICENSE](LICENSE) file for more details.