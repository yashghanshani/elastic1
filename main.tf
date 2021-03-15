##################
# Test Bucket
##################
resource "aws_s3_bucket" "yash_default" {
    bucket = "javabuckettest"
}

resource "aws_s3_bucket_object" "yash_default" {
    bucket = "javabuckettest"
    key    = "new_object_key"
    source = "acnauth-1.0.0.jar"
}

############################################
# ELASTICBEANSTALK
############################################
resource "aws_elastic_beanstalk_application" "ElasticBeanStalkApplication" {
  name        = "test-acn-auth"
  description = "AWS Elastic Beanstalk JAVA Application"
}


resource "aws_elastic_beanstalk_environment" "ElasticBeanStalkEnvironment" {
  name                = "test-acn-auth-env"
  application         = aws_elastic_beanstalk_application.ElasticBeanStalkApplication.id
  solution_stack_name = "64bit Amazon Linux 2 v3.1.6 running Corretto 11"

  setting  {
        namespace   = "aws:elasticbeanstalk:environment"
        name        = "EnvironmentType"
        value       = "LoadBalanced"
    }

   setting  {
        namespace   = "aws:elasticbeanstalk:environment"
        name        = "LoadBalancerType"
        value       = "network"
    }
    
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-a95edec2"
  }

  setting {
        namespace   = "aws:ec2:vpc"
        name        = "Subnets"
        value       = "subnet-872088ec ,subnet-8fad4cf2 "
    }

setting  {
        namespace   = "aws:autoscaling:launchconfiguration"
        name        = "IamInstanceProfile"
        value       = "aws_iam_instance_profile.ec2.name"
    }
  setting  {
        namespace   = "aws:autoscaling:launchconfiguration"
        name        = "InstanceType"
        value       = "t2.micro"
    }
  

}
