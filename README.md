# stellar-dev-env

## Description

Stellar-Dev-Env is a tool based on GitLab CI that helps you build and release a Docker image for your stellar-c development environment quickly and easily.

## Usage

Step 1: Login to private docker registry, use the following command:

```
docker login https://git.mesalab.cn:7443 -u $your_username -p $your_passwd

```

Replace `your_username`  and  `your_passwd` with your private account.

Step 2: Pull the stellar-dev-env Docker image, use the following command:

```
docker pull git.mesalab.cn:7443/stellar/stellar-dev-env:$tag
```

Replace `tag` with the desired version or branch name, such as `main`.

After successfully pulling the image, you can use the stellar-dev-env Docker container as needed.

## Development Components

The stellar-dev-env Docker image comes pre-installed with essential development components, including:

* sapp
* stellar-c
* libMESA_htable
* ibMESA_handle_logger
* libMESA_prof_load
* libMESA_field_stat2
* libMESA_jump_layer
* libfieldstat3
* libfieldstat4
* libbreakpad_mini
* libcjson
