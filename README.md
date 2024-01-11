# Project Name: Dockerized Infrastructure Mastery

## Overview

Welcome to the Dockerized Infrastructure Mastery project! This project is designed to enhance your understanding of system administration by immersing you in the world of Docker. You will be creating a virtualized environment with various Docker images, each serving a specific purpose, and all orchestrated within a virtual machine.

## Chapter III: General Guidelines

- This project must be executed within a Virtual Machine.
- Organize all configuration files in a 'srcs' folder.
- A Makefile, located at the root, should automate the entire application setup using 'docker-compose.yml'.
- Delve into Docker documentation to solidify your understanding of necessary concepts.

## Chapter IV: Mandatory Part

In this section, your task is to set up a small infrastructure composed of different services adhering to specific rules. Key points include:

- Docker images and corresponding services should share identical names.
- Containers for each service must run independently.
- Choose between Alpine or Debian for container performance, building Docker images from scratch.
- Prohibited from pulling ready-made Docker images or using DockerHub services.
- Setup includes NGINX with TLSv1.2 or TLSv1.3, WordPress + php-fpm, MariaDB, volumes for WordPress database and files, and a Docker network connecting all containers.
- Containers must restart in case of a crash.

## Chapter V: Inception

- Forbidden: network:host, --link, links:; Docker network configuration is mandatory.
- Containers must not start with an infinite loop command or entrypoint script.
- WordPress database must have two users, with the administrator username following specific criteria.
- Volumes accessible on the host machine at `/home/login/data`.
- Configure the domain name 'login.42.fr' to point to your local IP address.
- Prohibit the use of the latest tag, no passwords in Dockerfiles, and enforce the use of environment variables stored in a .env file.

## Chapter VI: Directory Structure Example

```bash
.
├── Makefile
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── bonus
        │   ├── adminer
        │   │   ├── Dockerfile
        │   │   └── tools
        │   │       └── setup_adminer.sh
        │   ├── ftp
        │   │   ├── Dockerfile
        │   │   └── tools
        │   │       └── setup_ftp.sh
        │   ├── netdata
        │   │   └── Dockerfile
        │   ├── portfolio
        │   │   ├── Dockerfile
        │   │   └── tools
        │   │       └── index.html
        │   └── redis
        │       └── Dockerfile
        ├── mariadb
        │   ├── Dockerfile
        │   └── tools
        │       ├── db_setup.sh
        │       └── wp_backup.sql
        ├── nginx
        │   ├── Dockerfile
        │   ├── conf
        │   │   ├── default.conf.template
        │   │   └── nginx.conf
        │   └── tools
        │       └── index.html
        └── wordpress
            ├── Dockerfile
            └── conf
                ├── wp-config.php.template
                └── www.conf.template
```

## Chapter VII: Bonus Part

- Dockerfiles for additional services, each running in its own container with dedicated volumes.
- Bonus list includes setting up Redis cache for WordPress, FTP server, a non-PHP static website, Adminer, and a service of your choice justified during the defense.
- The possibility to set up extra services, opening additional ports as needed.

## Conclusion

Embark on this Dockerized Infrastructure Mastery journey to deepen your system administration skills. Feel free to explore bonus challenges to further enhance your expertise. Happy Dockerizing!
