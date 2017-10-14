project="project-name"

echo "Commencing Bedrock Setup"

# Make a database, if we don't already have one
echo "Creating database"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS $project"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON $project.* TO wp@localhost IDENTIFIED BY 'wp';"

# Download Bedrock
if [ ! -d htdocs ]
then

  # Nginx Logs
  echo "Creating logs"
  mkdir -p ${VVV_PATH_TO_SITE}/log
  touch ${VVV_PATH_TO_SITE}/log/error.log
  touch ${VVV_PATH_TO_SITE}/log/access.log

  echo "Installing Bedrock stack using Composer"
  composer create-project roots/bedrock htdocs

  # Download Sage
  echo "Downloading Sage"
  cd htdocs/web/app/themes
    git clone https://github.com/roots/sage.git --branch 8.5.3 --single-branch
fi

# The Vagrant site setup script will restart Nginx for us

echo "$project Bedrock site now installed";
