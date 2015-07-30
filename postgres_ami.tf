provider "aws" {
	region     = "us-east-1"
}

resource "aws_instance" "web"{

    connection={
        user="ubuntu"
        key_file="/usr/local/bin/MikeMastro.pem"
        agent = false
    }
    ami = "${var.ami_id}"
    instance_type = "t2.micro"
    key_name = "MikeMastro"
    provisioner "remote-exec" {
        inline = [
            "set -exu",
            "sudo reboot"
        ]
    }
}
