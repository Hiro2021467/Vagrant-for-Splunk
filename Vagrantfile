#
# Common settings for all virtual machines
#
Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 1
    # vb.gui = true
    vb.customize [
      "modifyvm", :id,
      "--ioapic", "on",
      "--graphicscontroller", "vmsvga",
      "--nicpromisc2", "allow-all"
    ]
  end

#
# CentOS 9 / splunk
#
  config.vm.define :splunk do |splunk|
    splunk.vm.box = "boxomatic/centos-stream-9"
    splunk.vm.network "private_network", mac: "00006c000110", ip: "192.168.111.110", virtualbox__intnet: true
    splunk.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true # splunkダッシュボードのポートフォワーディング
    splunk.vm.hostname = "splunk.example.jp"
    splunk.vm.provider "virtualbox" do |vb|
      vb.name = "splunk"
    end
    splunk.vm.provision "shell", inline: $remove_vmtools
    splunk.vm.provision "shell", inline: $common_provisioning
    splunk.vm.provision "shell", inline: $CentOS9_provisioning
    # splunk.vm.provision "shell", path: "./setup_splunk.sh"
  end

end

#
# Common provisioning for all virtual machines
#
$common_provisioning = <<-'SCRIPT'
timedatectl set-timezone Asia/Tokyo
sed -e s/^'PasswordAuthentication no'/'PasswordAuthentication yes'/ /etc/ssh/sshd_config > /tmp/sshd_config
mv -f /tmp/sshd_config /etc/ssh/
chmod 0600 /etc/ssh/sshd_config
systemctl restart sshd.service
SCRIPT

#
# Remove open-vm-tools
#
$remove_vmtools = <<-'SCRIPT'
dnf -y remove open-vm-tools
SCRIPT

#
# Set the password for the account vagrant
#
$set_vagrant_password = <<-'SCRIPT'
echo 'vagrant' > pass.txt
echo 'vagrant' >> pass.txt
passwd vagrant < pass.txt
SCRIPT

#
# Provisioning for CentOS9
#
$CentOS9_provisioning = <<-'SCRIPT'
dnf -y update
reboot
SCRIPT