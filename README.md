ENCS Humanoid / Devops
======

Configuration management for ROS/Linux machine instances, using Vagrant for development

### What is Vagrant?

You probably already use virtual machines in your work, either in the cloud or on your own computer so that you can encapsulate a server into a convenient object that can be cloned, updated, distributed easily, and your operating system can be version-controlled much like the software in your other projects. This means several developers can each have a personal copy of the platform that will be used in production deployment, down to configurations and packages. And this is a boon: much time will be saved when the different pieces of a project don't have to clash because they were developed on slightly different platforms.

So, if your team members each develop against copies of the same platform, you win.

So what is Vagrant? Vagrant takes care of much of the grunt work of farming VMs, so that you can develop your robot, your vision system, your AI, and waste less time configuring and copying VMs around. 

Vagrant leverages VirtualBox, and on top of it:

+ Let's you download a box from the net and boot it with one command.
+ The VM can provision itself, installing or updating the latest packages when you build it.
+ The VM will contain a directory that you can access from your host operating system. You can use your favorite Windows/Mac/Linux tools from that host, to edit and develop the software that runs on the VM while simultaneously running that software in the VM. In this way the things that change - your project code files - are kept out of and separated from the VM that runs the software. You can trash the box and rebuild it without your project being touched.

### Specifics for the Humanoid Project

The VMs we will work with contain Ubuntu 12.04 LTS, on x86_64, with ROS Hydro. The current VMs can be considered alpha, so please chime in with ideas and constructive criticisms. At this time there are two choices: a base ROS Hydro box without a desktop, and a full ROS Hydro desktop box. We can run multiple VMs in communication with one another, as in a distributed ROS system with different machines for different supporting tasks.

### Quick Start

##### Preparing your machine for development with a ROS VM</em>

+ Install <a href="https://www.virtualbox.org">Virtualbox</a>.
+ After you have Virtualbox, install <a href="http://www.vagrantup.com">Vagrant</a>.

##### Developing your ROS code with a Vagrant VM

Create a directory for
your code on your physical machine somewhere, and download the appropriate Vagrantfile from the Vagrantfiles
directory above into your code directory. Go to your code directory and type:

```sh
$ vagrant up
```

The appropriate virtual machine will be pulled from the net, started, and provisioned with ROS for you.
You can shell into the VM with:

```sh
$ vagrant ssh
```

<a href="http://wiki.ros.org/hydro">ROS Hydro Medusa</a> will be installed.

You may edit your code directly in your own physical machine's OS, in the directory you created, with your favorite editors. The virtual machine will see your code directory as "/vagrant" in the Linux environment. In this way your code is separated from the virtual machine.

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

### Configuring a bare metal machine

It may be easier to run a physical, non-virtual machine when it requires connections to various hardware devices. For this machine, you may use the same provisioning scripts that the Vagrant boxes use.

For example, let's say you already have a computer running Ubuntu 12.04 LTS, x86_64, with a full desktop install, and you want to install ROS on it to match what we're using on other machines or VMs. You may paste this to a root shell command line:

```sh
# curl https://raw.githubusercontent.com/encs-humanoid/devops/master/provision/build_hydro_full.sh | sh
```

For a physical machine with a stripped down install of Ubuntu 12.04 LTS, x86_64, you may prefer to do this:

```sh
# curl https://raw.githubusercontent.com/encs-humanoid/devops/master/provision/build_hydro_base.sh | sh
```

### License

pending...


