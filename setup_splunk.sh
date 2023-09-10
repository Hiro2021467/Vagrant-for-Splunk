# Splunk用に設定した項目
# 1. splunkのインストール(wget -O splunk-8.2.4-87e2dda940d1-linux-2.6-x86_64.rpm "https://download.splunk.com/products/splunk/releases/8.2.4/linux/splunk-8.2.4-87e2dda940d1-linux-2.6-x86_64.rpm")
# 2. splunkの自動起動設定（systemctl）
# 3. ポート開放(8000, 22?)
# ポートフォワードも必要
sudo rpm -i splunk-8.2.4-87e2dda940d1-linux-2.6-x86_64.rpm
sudo /opt/splunk/bin/splunk start --accept-license --no-prompt --answer-yes
sudo /opt/splunk/bin/splunk stop
sudo /opt/splunk/bin/splunk enable boot-start # -systemd-managed 1 # -user vagrant
sudo systemctl restart Splunkd.service
# sudo chown -R vagrant:vagrant /opt/splunk
sudo systemctl start firewalld
sudo firewall-cmd --add-port=8000/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8000/udp --zone=public --permanent
sudo firewall-cmd --reload