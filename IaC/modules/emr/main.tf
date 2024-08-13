# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# Provisioning EMR resources

# Crteating a cluster EMR
resource "aws_emr_cluster" "cluster" {
  
  # Cluster Name
  name = var.name_emr
  
  # Version
  release_label = "emr-7.0.0"
  
  # Applications
  applications  = ["Hadoop", "Spark"]

  # Implementing cluster termination protection
  termination_protection = false
  
  # Mantaining the processing job active
  keep_job_flow_alive_when_no_steps = false
  
  # URI for logs folder
  log_uri = "s3://${var.name_bucket}/logs/"

  # Service Role IA
  service_role = var.service_role

  # Atributs for EC2 instances
  ec2_attributes {
    instance_profile = var.instance_profile
    emr_managed_master_security_group = aws_security_group.main_security_group.id
    emr_managed_slave_security_group = aws_security_group.core_security_group.id
  }

  # Master Instance Type
  master_instance_group {
    instance_type = "m5.4xlarge"
  }

  # Workers Instance Type
  core_instance_group {
    instance_type  = "m5.2xlarge"
    instance_count = 2
  }

  # Run the installation script for the Python interpreter and additional packages
  bootstrap_action {
    name = "Instala pacotes python adicionais"
    path = "s3://${var.name_bucket}/scripts/bootstrap.sh"
  }

# Steps executed on the cluster
# 1- Copies the files from S3 to the EC2 instances in the cluster. If it fails, terminates the cluster.
# 2- Copies the log files from S3 to the EC2 instances in the cluster. If it fails, terminates the cluster.
# 3- Executes the Python script to process the job. If it fails, keeps the cluster active to investigate the cause of the failure.

  step = [
    {
      name              = "Copia scripts python para maquinas EC2"
      action_on_failure = "TERMINATE_CLUSTER"

      hadoop_jar_step = [
        {
          jar        = "command-runner.jar"
          args       = ["aws", "s3", "cp", "s3://${var.name_bucket}/pipeline", "/home/hadoop/pipeline/", "--recursive"]
          main_class = ""
          properties = {}
        }
      ]
    },
    {
      name              = "Copia arquivos de log para maquinas EC2"
      action_on_failure = "TERMINATE_CLUSTER"

      hadoop_jar_step = [
        {
          jar        = "command-runner.jar"
          args       = ["aws", "s3", "cp", "s3://${var.name_bucket}/logs", "/home/hadoop/logs/", "--recursive"]
          main_class = ""
          properties = {}
        }
      ]
    },
    {
      name              = "Executa script python"
      action_on_failure = "CONTINUE"

      hadoop_jar_step = [
        {
          jar        = "command-runner.jar"
          args       = ["spark-submit", "/home/hadoop/pipeline/projeto2.py"]
          main_class = ""
          properties = {}
        }
      ]
    }
  ]

  # Spark's configuration file
  configurations_json = <<EOF
    [
    {
    "Classification": "spark-defaults",
      "Properties": {
      "spark.pyspark.python": "/home/hadoop/conda/bin/python",
      "spark.dynamicAllocation.enabled": "true",
      "spark.network.timeout":"800s",
      "spark.executor.heartbeatInterval":"60s"
      }
    }
  ]
  EOF

}