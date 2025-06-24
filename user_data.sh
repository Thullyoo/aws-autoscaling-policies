#!/bin/bash
yum update -y
yum install -y httpd
echo "Hello World" > /var/www/html/index.html
 
cat <<EOL > /var/www/html/teste
#!/bin/bash
echo "Content-type: text/plain"
echo ""
echo "Requisição recebida em $(hostname)"
sleep 5
EOL
 
chmod +x /var/www/html/teste
systemctl start httpd
systemctl enable httpd