# You need execute "bash set_ssh.sh".
# change permission for update file
ssh 192.168.33.10 sudo chmod -R 777 /vagrant/mongodb/db/
scp -r -P 2222 ./db/*  vagrant@192.168.33.10:/vagrant/mongodb/db/
