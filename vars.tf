variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "PRIVATE_KEY_PATH" {
  default = "london-region-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "london-region-key-pair.pub"
}

variable "EC2_USER" {
  default = "ec2-user"
}
variable "AMI" {
  type = map(string)

  default = {
    eu-west-2 = "ami-01a6e31ac994bbc09"
  }
}

variable "AWS_CREDENTIAL" {
    type = map(string)
    
    default = {
        access_key = "<<>>"
		secret_key = "<<>>"
    }
}