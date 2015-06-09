ENCS Humanoid / Devops
======



### A System for Development

We are standardizing our systems and subsystems to use the <a href="http://wiki.ros.org/indigo">Indigo</a> release of the <a href="http://ros.org">Robot Operating System (ROS)</a>. We are asking that teams do their coding on <em>Ubuntu 14.04 LTS x86_64 Desktop</em> as much as is feasible. It can be installed on VMWare, Virtualbox, or a bare metal computer.

We will run multiple distributed ROS systems in communication with one another, with different machines for different supporting tasks.

For those using Linux or Macintosh computers, <a href="https://www.vagrantup.com">Vagrant</a> is recommended. [Our Vagrant setup](vagrant_overview.md) will install ROS for you. Vagrant can be used with Windows as well, but some people find the setup to be less friendly.

<hr>

### Preparing Your System

(Skip 1 and 2 if using Vagrant.)

##### 1) Install the Desktop version of Ubuntu 14.04 LTS, x86_64 either as a virtual machine or on your physical computer.

<a href="http://releases.ubuntu.com/14.04/">Images are available here</a>. You will want <em>64-bit PC (AMD64) desktop CD</em>. If you need help installing Ubuntu, you are welcome to consult Mark Whelan at a meeting.

##### 2) Within your running version of Ubuntu, install the full verion of ROS Indigo.

The easiest way to do this is to go to a command line in your Ubuntu box and paste the following:

```sh
curl https://raw.githubusercontent.com/encs-humanoid/devops/master/provision/build_indigo_full.sh | sh
```

Be aware that this command can take a very long time to finish. Afterward, you will need to run the following command (just this once) to set up your current enviroment:

```sh
source ~/.bashrc
```

##### 3) Complete any optional installations.

If you are on the A.I. team, you might continue with the following installations.

To install NLTK 3.0:

```sh
curl https://raw.githubusercontent.com/encs-humanoid/devops/master/provision/install_nltk.sh | sh
```

<em>If you want Nupic, it is important to allocate at least 2 Gb of RAM to your Ubuntu system.</em> To install Nupic:

```sh
curl https://raw.githubusercontent.com/encs-humanoid/devops/master/provision/install_nupic.sh | sh
```

Note that each of these installations can take a while.
