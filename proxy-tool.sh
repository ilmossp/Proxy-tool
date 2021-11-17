##test-comment:
cd /etc
if [ -f environment.bak ]; 
then
    echo "Disabling Proxy..."
    sudo cp environment environment.proxy.bak
    sudo cp environment.bak environment
    sudo rm environment.bak
elif [ -f environment.proxy.bak ]; 
then
    echo "Enabling Proxy..."
    sudo cp environment environment.bak
    sudo cp environment.proxy.bak environment
    sudo rm environment.proxy.bak 
else 
    echo "Enabling Proxy for the first time"
    sudo cp environment environment.bak 
    sudo echo -e "http_proxy=\"http://10.23.201.11:3128/\"\n\
https_proxy=\"http://10.23.201.11:3128/\"\n\
ftp_proxy=\"http://10.23.201.11:3128/\"\n\
rsync_proxy=\"http://10.23.201.11:3128/\"\n\
no_proxy=\"localhost,127.0.0.1,192.168.1.1,::1,*.local\"\n\
HTTP_PROXY=\"http://10.23.201.11:3128/\"\n\
HTTPS_PROXY=\"http://10.23.201.11:3128/\"\n\
FTP_PROXY=\"http://10.23.201.11:3128/\"\n\
RSYNC_PROXY=\"http://10.23.201.11:3128/\"\n\
NO_PROXY=\"localhost,127.0.0.1,192.168.1.1,::1,*.local\"\n" >> environment
fi  