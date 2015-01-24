# Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [NFS (if you are on
  linux)](https://help.ubuntu.com/lts/serverguide/network-file-system.html)

# Rules of thumb

If asked for password while launching your VM enter your **hosts** root password
— that happens due to NFS setup.

# Getting started

    > git clone https://github.com/ryakh/airglow-dev-box.git
    > cd airglow-dev-box
    > vagrant up

That's it.

After the installation has finished, you can access the virtual machine with

    > vagrant ssh

Ports 3000, 4200, 35729 from virtual machine are forwarded to ports 3000, 4200
and 35729 on the host machine:

* 3000 — rails server
* 4200 — ember server
* 35729 — livereload server

# Operating VM

All commands have to be run from host machine.

To suspend (put it into hibernation) VM run:

    > vagrant suspend

To resume VM run:

    > vagrant resume


To shut VM down run:

    > vagrant halt

To run VM run:

    > vagrant up

To get VM status run:

    > vagrant status

# Sharing files between VM and host

By default ~/ folder from your host is mounted into /host folder on the VM.

# Launching servers

To launch rails server run inside VM (this will run server in daemon mode, use
`kill -9` to terminate it):

    > rails s -b 0.0.0.0 -d

To launch ember server run inside VM:

    > ember serve --watcher polling --proxy http://localhost:3000