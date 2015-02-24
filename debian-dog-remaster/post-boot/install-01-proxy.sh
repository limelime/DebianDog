INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Add proxy in /etc/environment
cat >> /etc/environment <<EOF
http_proxy="http://proxy.wdf.sap.corp:8080"
https_proxy="http://proxy.wdf.sap.corp:8080"
ftp_proxy="http://proxy.wdf.sap.corp:8080"
no_proxy="localhost,127.0.0.1,sap.corp"
HTTP_PROXY="http://proxy.wdf.sap.corp:8080"
HTTPS_PROXY="http://proxy.wdf.sap.corp:8080"
FTP_PROXY="http://proxy.wdf.sap.corp:8080"
NO_PROXY="localhost,127.0.0.1,sap.corp"
EOF

### Add proxy in /etc/apt/apt.conf
cat >> /etc/apt/apt.conf <<EOF
Acquire::http::proxy "http://proxy.wdf.sap.corp:8080/";
Acquire::ftp::proxy "ftp://proxy.wdf.sap.corp:8080/";
Acquire::https::proxy "https://proxy.wdf.sap.corp:8080/";
EOF