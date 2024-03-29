# Chao$ CTF
This is a simple Capture The Flag game that you can download and play yourself. It covers some basic vulnerabilities in 5 diffent levels.

## Installation
**IMPORTANT: DON'T CHECK THE SOURCES OF THE GAME BEFORE PLAYING IT, YOU WILL SPOIL YOURSELF THE FLAGS!**
 1. Clone the repository
 2. Build and run with `docker-compose` on the project root:
    ```
    docker-compose up -d
    ```
After following these two steps, your computer will be serving the game on an ssh server on port 22.

## How to play
These are the credentials for the first level:
 - Username: `chaos0`
 - Password: `chaos0`

Here goes some extra advice on the game:
 - Every user corresponds to one level (`chaos0`, `chaos1`, `chaos2`..)
 - The password of each user is the flag found on the previous level.
 - You can find all the flags on the `/etc/chaos_pass` folder.
 - You will find some useful tools in the container, such as `gdb` or `checksec`.
 - You can create a temporal folder with `mktemp -d`, but if you need it you can also manually create files and folders in the `/tmp` directory.
 - Although they're called temporal folders, these won't be automatically removed.
