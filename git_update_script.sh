## Tag Image, push to dockerhub, clone the repo, update the image tag in the deployment file, commit and push
#!/bin/bash

# exit if any command fails
set -e

new_ver=$1

## Check if directory exist
if [ -d "argocd-nginx" ]; then
  echo "Directory argocd-nginx already exists. Exiting."
  rm -rf argocd-nginx
  echo "Directory argocd-nginx removed."
  else
    echo "Directory argocd-nginx does not exist. Proceeding."
fi

echo "new version: $new_ver"

# Simulate release of the new docker images
docker tag nginx:latest jmcglobal/nginx:$new_ver

# Push new version to dockerhub
docker push jmcglobal/nginx:$new_ver

# Create temporary directory
temp_dir=$(mktemp -d)
echo "Temporary directory created: $temp_dir"
# Change to the temporary directory

# Clone the repository
git clone https://github.com/Jmcglobal/argocd-nginx.git $temp_dir

# Update image tag in the deployment file
sed -i '' -e "s/jmcglobal\/nginx:.*/jmcglobal\/nginx:$new_ver/g" $temp_dir/argocd-nginx/deployment.yaml

# Commit and push
cd $temp_dir
git add .
git commit -m "Update image tag to $new_ver"
git push

# optionally remove the temporary directory
rm -rf $temp_dir

## run the sscript with the version u want 
# ./git_script.sh 1.0.0