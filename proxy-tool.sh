##test-comment:
#read user input

echo "input proxy address: "
read user_proxy_address
echo "input proxy port: "
read user_proxy_port

#use input in script
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
    sudo echo -e "http_proxy=\"http://$user_proxy_address:$user_proxy_port/\"\n\
https_proxy=\"http://$user_proxy_address:$user_proxy_port/\"\n\
ftp_proxy=\"http://$user_proxy_address:$user_proxy_port/\"\n\
rsync_proxy=\"http://$user_proxy_address:$user_proxy_port/\"\n\
no_proxy=\"localhost,127.0.0.1,192.168.1.1,::1,*.local\"\n\
HTTP_PROXY=\"http://$user_proxy_address:$user_proxy_port/\"\n\
HTTPS_PROXY=\"http://$user_proxy_address:$user_proxy_port/\"\n\
FTP_PROXY=\"http://$user_proxy_address:$user_proxy_port/\"\n\
RSYNC_PROXY=\"http://$user_proxy_address:$user_proxy_port/\"\n\
NO_PROXY=\"localhost,127.0.0.1,192.168.1.1,::1,*.local\"\n" >> environment
fi  