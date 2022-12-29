resource "aws_key_pair" "this" {
  key_name = "terraform-key"
  public_key = file("./terraform-key.pub")
}

resource "aws_instance" "vm" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.this.key_name
  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  provisioner "file" {
    content = "public_ip: ${self.public_ip}"
    destination = "/tmp/public_ip.txt"
  }

  provisioner "file" {
    source = "./index.html"
    destination = "/home/ubuntu/index.html"
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./terraform-key")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo ami: ${self.ami} >> /tmp/ami.txt",
      "echo private_ip: ${self.private_ip} >> /home/ubuntu/private_ip.txt",
    ]
  }

  tags = {
    "Name" = "vm-terraform"
  }
}