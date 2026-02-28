#!/usr/bin/env bash
# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                                                           ║
# ║   DirectAdmin Check IPv6 v1.1.0                                           ║
# ║                                                                           ║
# ╠═══════════════════════════════════════════════════════════════════════════╣
# ║   Autor:   Percio Castelo                                                 ║
# ║   Contato: percio@evolya.com.br | contato@perciocastelo.com.br            ║
# ║   Web:     https://perciocastelo.com.br                                   ║
# ║                                                                           ║
# ║   Função:  Check which domains are using IPv6 (AAAA records)              ║
# ║            in DirectAdmin.                                                ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# Detect System Language (Get first 2 chars, e.g., 'pt' from 'pt_BR.UTF-8')
SYSTEM_LANG="${LANG:0:2}"

if [[ "$SYSTEM_LANG" == "pt" ]]; then
    # Portuguese Strings
    MSG_START="Iniciando verificação de domínios..."
    MSG_COL_DOMAIN="Domínio"
    MSG_COL_IPV6="Usando IPv6?"
    MSG_YES="sim"
    MSG_NO="não"
    MSG_DONE="Lista gerada em"
else
    # English Strings (Default)
    MSG_START="Starting domain verification..."
    MSG_COL_DOMAIN="Domain"
    MSG_COL_IPV6="Using IPv6?"
    MSG_YES="yes"
    MSG_NO="no"
    MSG_DONE="List generated at"
fi

# Output File
OUTPUT_FILE="/var/www/html/ipv6-domains.txt"

# Start Message
echo "$MSG_START"

# Initialize File with Header
# %-40s defines a column of 40 chars aligned to the left
printf "%-40s | %-39s | %-10s\n" "$MSG_COL_DOMAIN" "AAAA" "$MSG_COL_IPV6" > "$OUTPUT_FILE"
printf '%.0s-' {1..95} >> "$OUTPUT_FILE"
echo >> "$OUTPUT_FILE"

# Loop through DirectAdmin user domains
# Note: Ensure you run this as root to access /usr/local/directadmin/data/users/
for d in $(cat /usr/local/directadmin/data/users/*/domains.list 2>/dev/null); do
    
    # Check for AAAA record (IPv6)
    aaaa=$(dig +short AAAA "$d")
    
    if [ -z "$aaaa" ]; then
        aaaa="-"
        ipv6_status="$MSG_NO"
    else
        # If multiple IPs return, take the first one to fit the table, or keep generic
        # Taking the first line only to maintain formatting
        aaaa=$(echo "$aaaa" | head -n 1)
        ipv6_status="$MSG_YES"
    fi

    # Append to output file
    printf "%-40s | %-39s | %-10s\n" "$d" "$aaaa" "$ipv6_status" >> "$OUTPUT_FILE"
done

# Final Message
echo "$MSG_DONE $OUTPUT_FILE"