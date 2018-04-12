######### forwarding-rules.txt
cat << 'EOF' > forwarding-rules.txt
# Converted from https://github.com/felixonmars/dnsmasq-china-list/blob/master/accelerated-domains.china.conf
# https://github.com/felixonmars/dnsmasq-china-list
# Thanks to all contributors.
EOF
wget https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf
# `server=/0-6.com/114.114.114.114` -> `0-6.com 114.114.114.114`
cat accelerated-domains.china.conf | sed -e 's/server=\/\(.*\)\/\(.*\)/\1 \2/g' >> forwarding-rules.txt

######### ip-blacklist.txt
cat << 'EOF' > ip-blacklist.txt
# Converted from https://github.com/felixonmars/dnsmasq-china-list/blob/master/bogus-nxdomain.china.conf
# https://github.com/felixonmars/dnsmasq-china-list
# Thanks to all contributors.
EOF
wget https://github.com/felixonmars/dnsmasq-china-list/raw/master/bogus-nxdomain.china.conf
cat bogus-nxdomain.china.conf | grep -v '^#' | sed -e '/^$/d' -e 's/\(.*\)=\(.*\)/\2/g' >> ip-blacklist.txt

######### blacklist.txt
cat << 'EOF' > blacklist.txt
# Converted from https://github.com/missdeer/blocklist/blob/master/toblock-without-shorturl-optimized.lst
# https://github.com/missdeer/blocklist
# Thanks to all contributors.
ad.*
ad[0-9]*
ads.*
ads[0-9]*
EOF
wget https://github.com/missdeer/blocklist/raw/master/toblock-without-shorturl-optimized.lst
cat toblock-without-shorturl-optimized.lst | grep -v 'ad.*' | grep -v 'ad[0-9]*' | grep -v 'ads.*' | grep -v 'ads[0-9]*' >> blacklist.txt

######### cloaking-rules.txt
cat << 'EOF' > cloaking-rules.txt
# Converted from https://github.com/googlehosts/hosts/blob/master/hosts-files/dnscrypt-proxy-cloaking.txt
# https://github.com/googlehosts/hosts
# Thanks to all contributors.
EOF
wget https://github.com/googlehosts/hosts/raw/master/hosts-files/dnscrypt-proxy-cloaking.txt
cat dnscrypt-proxy-cloaking.txt >> cloaking-rules.txt
