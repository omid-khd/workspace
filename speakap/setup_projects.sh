#!/bin/bash

if ! command -v git &>/dev/null; then
    echo "Git is not installed on this machine"
    exit 1
fi

directory_exists() {
    if [ -d "$1" ]; then
        return 0
    else
        return 1
    fi
}

create_directory() {
    mkdir -p "$1"
}

clone_repository() {
    git clone "$2" "$1"
}

setup_project () {
    pwd=$(pwd)
    project_directory="$1"

    cd "$project_directory"
    cp "config/parameters.docker.yaml" "config/parameters.yml"
    echo "APP_ENV=prod" >> ".env.local"
    echo "APP_DEBUG=0" >> ".env.local"
    echo "Whats your github username?"
    read username
    echo "Whats your github access token?"
    read token
    docker login ghcr.io -u "$username" -p "$token"
    ssh-add > /dev/null 2>&1
    make docker-php-local
    docker-compose -f docker/compose/local/docker-compose.yaml up -d
    cd "$pwd"
}

echo "Enter the projects directory path (make sure directory exist and the user who runs this script has proper permissions): "
read -e input

target_directory=$(eval echo "$input")

if ! directory_exists "$target_directory"; then
    create_directory "$target_directory"
fi

clone_repository "$target_directory/Speakap-API" "git@github.com:SpeakapBV/Speakap-API.git"
setup_project "$target_directory/Speakap-API"

# if [ ! -d "$project_path/Speakap-API" ]; then
#     echo "Repository is not cloned. Proceeding with cloning..."
#     mkdir "$project_path/Speakap-API"
#     git clone git@github.com:SpeakapBV/Speakap-API.git "$project_path/Speakap-API"
#     cp "$project_path/Speakap-API/config/parameters.docker.yaml" "$project_path/Speakap-API/config/parameters.yml"
#     echo "APP_ENV=prod" >> "$project_path/Speakap-API/.env.local"
#     echo "APP_DEBUG=0" >> "$project_path/Speakap-API/.env.local"
#     echo "Whats your github username?"
#     read username
#     echo "Whats your github access token?"
#     read token
#     docker login ghcr.io -u "$username" -p "$token"
#     make docker-php-local docker_target=production
# fi
