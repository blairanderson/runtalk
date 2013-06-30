This Repo holds our Services. It is setup with Vagrant. 

Make sure the vagrant file is forwarding ports for 3000 and 9292

after cloning, fire up the VM:

    $ vagrant up


SSH into the VM:

    $ vagrant ssh


Start the redis-server

    $ redis-server


To help debug, start the redis-cli and run monitor

    $ redis-cli
    $ monitor


Start the faye server:

    $ rackup private_pub.ru -s thin -E production


Start the rails server of the chat application:

    $ cd /vagrant/runtalk-chat
    $ rails s -p 3000


Start the rails server of the messages application:

    $ cd /vagrant/runtalk-messages
    $ rails s -p 3001
