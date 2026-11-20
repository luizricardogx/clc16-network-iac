# 1. Busca a AMI mais recente do Amazon Linux 2023 automaticamente
#data "aws_ami" "amazon_linux_2023" {
 # most_recent = true
  #owners      = ["amazon"]
#
 # filter {
  #  name   = "name"
   # values = ["al2023-ami-2023*-x86_64"]
 #}
#}

# 2. Security Group na VPC clc_vpc liberando a porta 80 (HTTP)
#resource "aws_security_group" "web_sg" {
 # name        = "allow_http_apache"
  #description = "Libera acesso HTTP na porta 80"
  #vpc_id      = aws_vpc.clc_vpc.id

  #ingress {
   #description = "HTTP da Internet"
    #from_port   = 80
    #to_port     = 80
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  #egress {
    #from_port   = 0
    #to_port     = 0
    #protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  #tags = {
    #Name = "sg-apache-publico"
  #}
#}

# 3. Instância EC2 na subnet 172.16.1.0/24 (public_subnet_1a)
#resource "aws_instance" "web_server" {
  #ami                         = data.aws_ami.amazon_linux_2023.id
  #instance_type               = "t2.micro"
  #subnet_id                   = aws_subnet.public_subnet_1a.id
  #vpc_security_group_ids      = [aws_security_group.web_sg.id]
  #associate_public_ip_address = true

  #user_data = <<-EOF
              #!/bin/bash
              #dnf update -y
              #dnf install -y httpd
              #systemctl start httpd
              #systemctl enable httpd
              #echo "<h1>CHEGUEI AT&Eacute; AQUI - [Luiz Ricardo G. Xavier] - CLC 16</h1>" > /var/www/html/index.html
              #EOF

  #tags = {
    #Name = "EC2-Apache-CLC16"
  #}
#}

# 4. Output com a URL pronta para acesso
#output "url_apache" {
  #description = "Link direto para acessar a página no navegador"
  #value       = "http://${aws_instance.web_server.public_ip}"
#}