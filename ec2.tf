resource "aws_instance" "web1" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

    # the Public SSH key
    key_name = "${aws_key_pair.london-region-key-pair.id}"

    # httpd installation
    provisioner "file" {
        source = "httpd.sh"
        destination = "/tmp/httpd.sh"
    }

    provisioner "remote-exec" {
        inline = [
			"cd /tmp/",
            "chmod +x httpd.sh",
            "sudo sh ./httpd.sh"
        ]
    }

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
		host = self.public_ip
    }
}

resource "aws_key_pair" "london-region-key-pair" {
    key_name = "london-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}