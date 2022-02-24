# A script to run on a fresh vps (debian 10/11) to setup sudo, a user and tailscale

# Updating and Upgrading
echo "Running apt update & upgrade"
apt-get update && apt upgrade -y

echo "Installing Curl"
apt-get curl

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


echo "Setting up Tailscale"
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

# Update and Install tailscale
apt-get update
apt-get install tailscale

# Confirm login of tailscale
tailscale up