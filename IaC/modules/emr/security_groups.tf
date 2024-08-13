# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# Security Groups

# Definition of the security group resource for the EMR master node
resource "aws_security_group" "main_security_group" {
  
  # Security Group Name
  name = "dsd-emr-main-security-group-p1"
  
  # Security Group Description
  description = "Allow inbound traffic for EMR main node."

  # Option to revoke security options when the security group has been deleted
  revoke_rules_on_delete = true

  # Ingrees rule to allow trafic SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to permit trafic without restrictions (any port)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Definição do recurso de grupo de segurança para os nós core (workers) do EMR
resource "aws_security_group" "core_security_group" {
  
  # Nome do grupo de segurança
  name = "dsd-emr-core-security-group-p1"
  
  # Descrição do grupo de segurança
  description = "Allow inbound outbound traffic for EMR core nodes."

  # Opção para revogar regras de segurança ao deletar o grupo de segurança
  revoke_rules_on_delete = true

  # Regra de entrada para permitir todo o tráfego de entrada dentro do próprio grupo de segurança
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }

  # Regra de saída para permitir todo o tráfego de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
