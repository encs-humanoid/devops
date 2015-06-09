ENCS Humanoid / Devops
======

Configuration management for ROS/Linux machine instances, using Vagrant for development

### Developing your ROS code with a Vagrant VM for Macintosh or Linux

Create a directory for your code on your physical machine somewhere, and cd to it.

If you want the full desktop version of the ROS virtual machine, you can copy this to your command line and run it from within your code directory in order to fetch the appropriate Vagrantfile:

```sh
$ wget https://raw.githubusercontent.com/encs-humanoid/devops/master/Vagrantfiles/desktop-full/Vagrantfile
```

For those who prefer the base install, you can run this instead:

```sh
$ wget https://raw.githubusercontent.com/encs-humanoid/devops/master/Vagrantfiles/base/Vagrantfile
```

Go to your code directory and type:

```sh
$ vagrant up
```

The appropriate virtual machine will be pulled from the net, started, and provisioned with ROS for you.
You can shell into the VM with:

```sh
$ vagrant ssh
```

<a href="http://wiki.ros.org/indigo">ROS Indigo Igloo</a> will be installed.

You may edit your code directly in your own physical machine's OS, in the directory you created, with your favorite editors. The virtual machine will see your code directory as "/vagrant" in the Linux guest environment. In this way your code is separated from the virtual machine. If you are working with the full desktop version and you find you need the password, it is "vagrant".

You can stop the VM with:

```sh
$ vagrant halt
```

or completely remove it with:

```sh
$ vagrant destroy
```

If you destroy the VM, a new one will be provisioned when you run "vagrant up" the next time. Your code stays
in the directory you created on your local machine; only the VM is affected with the vagrant commands.

Much more can be done with Vagrant, which you can learn about from the <a href="http://docs.vagrantup.com/v2/">Vagrant Documentation</a>.



