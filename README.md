# DirectAdmin IPv6 Checker 🔍

Readme: [Português](README-ptbr.md)

![License](https://img.shields.io/github/license/sr00t3d/directadmin-checkipv6)
![Shell Script](https://img.shields.io/badge/Shell-script-green)

This script automates the verification of **AAAA (IPv6)** records for all domains hosted on a DirectAdmin server. It generates a formatted report indicating which domains are already operating with the new IP protocol version.

## 📋 Features

- Scans all users and domains configured in DirectAdmin.
- Performs real-time DNS queries (via `dig`).
- Generates a clean tabular report in `/var/www/html/ipv6-domains.txt`.
- Quickly identifies which domains have or do not have IPv6 pointing.

🚀 How to use  
1. Prerequisites  
Make sure you have the `dnsutils` utility (which contains the `dig` command) installed on your server:

CentOS/CloudLinux: `yum install bind-utils`

Debian/Ubuntu: `apt-get install dnsutils`

2. Installation  
Save the script on your server and give it execution permission:

```bash
chmod +x check_ipv6.sh
```

3. Execution  
Run the script as root:

```bash
./check_ipv6.sh
```

4. Viewing the Result

After execution, you can view the report directly through the terminal or via browser (if Apache/Nginx is running):

```bash
cat /var/www/html/ipv6-domains.txt
```

📊 Output Example

```bash
Domain                                   | AAAA                                    | Using IPv6?
-----------------------------------------------------------------------------------------------
example.com.br                           | 2001:db8:85a3::8a2e:370:7334            | yes       
another-site.net                         | -                                       | no
```

[!IMPORTANT]  
The script requires read permission in the DirectAdmin directories (/usr/local/directadmin/data/users/), therefore running it as the root user is recommended.

## ⚠️ Legal Notice

> [!WARNING]
> This software is provided "as is". Always make sure to test first in a development environment. The author is not responsible for any misuse, legal consequences, or data impact caused by this tool.

## 📚 Detailed Tutorial

For a complete, step-by-step guide, check out my full article:

👉 [**Check Domains Ipv6 on DirectAdmin**](https://perciocastelo.com.br/blog/check-domains-ipv6-on-directAdmin.html)

## License 📄

This project is licensed under the **GNU General Public License v3.0**. See the [LICENSE](LICENSE) file for more details.
