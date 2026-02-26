# DirectAdmin IPv6 Checker 🔍

Readme: [English](README.md)

![License](https://img.shields.io/github/license/sr00t3d/directadmin-checkipv6)
![Shell Script](https://img.shields.io/badge/Shell-script-green)

<img width="700" src="da-checkipv6-cover.webp" />

Este script automatiza a verificação de registros **AAAA (IPv6)** para todos os domínios hospedados em um servidor DirectAdmin. Ele gera um relatório formatado indicando quais domínios já estão operando com a nova versão do protocolo IP.

## 📋 Funcionalidades

- Varre todos os usuários e domínios configurados no DirectAdmin.
- Realiza consultas de DNS em tempo real (via `dig`).
- Gera um relatório tabular limpo em `/var/www/html/ipv6-domains.txt`.
- Identifica rapidamente quais domínios possuem ou não apontamento IPv6.

🚀 Como usar
1. Pré-requisitos
Certifique-se de ter o utilitário `dnsutils` (que contém o comando `dig`) instalado no seu servidor:

CentOS/CloudLinux: `yum install bind-utils`

Debian/Ubuntu: `apt-get install dnsutils`

2. Instalação
Salve o script no seu servidor e dê permissão de execução:

```bash
chmod +x check_ipv6.sh
```

3. Execução
Execute o script como root:

```bash
./check_ipv6.sh
```

4. Visualização do Resultado

Após a execução, você pode visualizar o relatório diretamente pelo terminal ou via navegador (se o Apache/Nginx estiver rodando):

```bash
cat /var/www/html/ipv6-domains.txt
```

📊 Exemplo de Saída

```bash
Domínio                                  | AAAA                                    | Usando IPv6?
-----------------------------------------------------------------------------------------------
exemplo.com.br                           | 2001:db8:85a3::8a2e:370:7334            | sim       
outro-site.net                           | -                                       | não
```

[!IMPORTANTE]  
O script requer permissão de leitura nos diretórios do DirectAdmin (/usr/local/directadmin/data/users/), portanto é recomendado executá-lo como usuário root.

## ⚠️ Aviso Legal

> [!AVISO]
> Este software é fornecido “como está”. Sempre certifique-se de testar primeiro em um ambiente de desenvolvimento. O autor não se responsabiliza por qualquer uso indevido, consequências legais ou impacto nos dados causados por esta ferramenta.

## 📚 Tutorial Detalhado

Para um guia completo, passo a passo, confira meu artigo completo:

👉 [**Verificar Domínios Ipv6 no DirectAdmin**](https://perciocastelo.com.br/blog/check-domains-ipv6-on-directAdmin.html)

## Licença 📄

Este projeto está licenciado sob a **GNU General Public License v3.0**. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
