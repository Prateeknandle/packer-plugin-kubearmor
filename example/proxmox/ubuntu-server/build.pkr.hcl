build {
  sources = ["source.proxmox-iso.ubuntu-server"]

  provisioner "shell" {
    inline = [
      "sudo truncate -s 0 /etc/machine-id"
    ]
  }

  provisioner "ansible" {
    playbook_file = "../../../ansible/conf.yml"
  }

  provisioner "kubearmor" {
    policyPath = "/home/ubuntu/policies"
  }
}
