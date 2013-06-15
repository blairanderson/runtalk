This Repo holds our Services. It is setup with Vagrant. 

after cloning, run:

    $ vagrant up


then to get into the VM, run:

    $ vagrant ssh

after you SSH into the VM, type:

    $ cd /vagrant/runtalk-chat
    $ rails s

open a new tab and SSH into the same VM

    $ vagrant ssh

then start the faye server:

    $ rackup private_pub.ru -s thin -E production


Make sure the vagrant file is forwarding ports for 3000 and 9292
