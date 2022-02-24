#!/bin/bash
# A script to run on a fresh vps (debian 10/11) to setup sudo, a user and tailscale

# Updating and Upgrading
echo "Running apt update & upgrade"
apt-get update && apt upgrade -y

echo "Installing Curl"
apt-get install curl -y

# Installing Sudo
echo "Setting up user with sudo permissions"
apt-get install sudo 

echo "Creating Sudo user"
echo
echo
echo "Create a username"
read -p 'Username:' username
#echo "Create a strong password"
#read -sp 'Password:' pass

adduser $username

#useradd $username
#passwd $username

usermod -aG sudo $username


#Change Hostname of VPS

read -p 'Hostname:' Hostname

hostnamectl set-hostname $Hostname

#Set timezone

echo "Set a timezone, example Europe/Paris"
read -p 'Timezone:' Timezone

timedatectl set-timezone $Timezone


echo "Setting up Tailscale"
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

# Update and Install tailscale
apt-get update
apt-get install tailscale

# Confirm login of tailscale
tailscale up

echo "Script completed"
sleep 2

echo "Forcing reboot in 10 seconds, press CTRL + C to Cancel"
sleep 1
echo "10"
sleep 1
echo "9"
sleep 1
echo "7"
sleep 1
echo "6"
sleep 1
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 0.5
echo "rebooting"
sleep 2
reboot
