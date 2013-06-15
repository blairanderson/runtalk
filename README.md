This Repo holds our Services. It is setup with Vagrant. 

Make sure the vagrant file is forwarding ports for 3000 and 9292

after cloning, fire up the VM:

    $ vagrant up


SSH into the VM:

    $ vagrant ssh

Start the rails server of the main chat application:

    $ cd /vagrant/runtalk-chat
    $ rails s

To start the faye server, open a new tab in the same folder, SSH in and start the faye server:

    $ vagrant ssh
    $ rackup private_pub.ru -s thin -E production


