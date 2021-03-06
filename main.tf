##################
# Test Bucket
##################
resource "aws_s3_bucket" "default" {
    bucket = "s3-source-code-bucket"
}

resource "aws_s3_bucket_object" "default" {
    bucket = "${aws_s3_bucket.default.id}"
    key    = "beanstalk/java.zip"
    source = "java.zip"
}

############################################
# ELASTICBEANSTALK
############################################
resource "aws_elastic_beanstalk_application" "test-acn-auth" {
  name        = "tf-test-name"
  description = "AWS Elastic Beanstalk JAVA Application"
}

resource "aws_elastic_beanstalk_environment" "test-acn-auth" {
  name                = "test-acn-auth-env"
  application         = "aws_elastic_beanstalk_application.test-acn-auth.name"
  solution_stack_name = "Corretto 11 running on 64bit Amazon Linux 2 v3.1.6 "

  setting = {
        namespace   = "aws:elasticbeanstalk:environment"
        name        = "EnvironmentType"
        value       = "LoadBalanced"
    }

    
  setting {
    namespace = "aws:elasticbeanstalk:vpc"
    name      = "VPCId"
    value     = "vpc-xxxxxxxx"
  }

  setting {
    namespace = "aws:elasticbeanstalk:vpc:loadbalancersettings"
    name      = "Visibilty"
    value     = "internal"
  }

  setting {
    namespace = "aws:elasticbeanstalk:vpc"
    name      = "Subnets"
    value     = "subnet-xxxxxxxx"
  }

  setting {
    namespace = "aws:elasticbeanstalk:vpc"
    name      = "Loadbalancer"
    value     = "subnet-xxxxxxxx"
  }

}
