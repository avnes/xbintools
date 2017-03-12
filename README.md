# xbintools
A collection of useful scripts for Linux

## Table of Contents
1. [killpal](#killpal)
2. [dockerkill](#dockerkill)
3. [dockerclean](#dockerclean)

## killpal
An alternative to the Linux killall or pkill commands where you more precise control over which process to kill.

### Installation
Place killall.sh in a location available in your $PATH, for instance in ~/bin directory

### Usage

```
Info:    killpal is used to kill running processes based on input pattern
Usage:   killpal.sh pattern
Example: killpal.sh chromium-browser
```

## dockerkill
An alternative to doing 'docker ps' and then 'docker kill <id>'.

### Installation
Place dockerkill.sh in a location available in your $PATH, for instance in ~/bin directory

### Usage

```
Info:    dockerkill is used to kill all running docker instances
Usage:   dockerkill.sh
```

## dockerclean
This utility is used to remove dangling images and clean them up.

### Installation
Place dockerclean.sh in a location available in your $PATH, for instance in ~/bin directory

### Usage

```
Info:    dockerclean is used to remove dangling images and cleanup
Usage:   dockerclean.sh
```
