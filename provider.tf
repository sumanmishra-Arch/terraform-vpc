provider "aws" {
    region = "${var.AWS_REGION}"
	access_key = "${var.AWS_CREDENTIAL.access_key}"
	secret_key = "${var.AWS_CREDENTIAL.secret_key}"
}