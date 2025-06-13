#!/bin/bash

# Client tools

curl -o cfssl https://github.com/cloudflare/cfssl/releases/download/v1.6.3/cfssl_1.6.3_darwin_amd64
chmod +x cfssl
sudo xattr -d com.apple.quarantine cfssl
mv cfssl /usr/local/bin/

curl -o cfssljson https://github.com/cloudflare/cfssl/releases/download/v1.6.3/cfssljson_1.6.3_darwin_amd64
chmod +x cfssljson
sudo xattr -d com.apple.quarantine cfssljson
mv cfssljson /usr/local/bin/

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | shasum -a 256 --check
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl
kubectl version --client --output=yaml

# Fallback HomeBrew
# brew install kubernetes-cli
# brew link --overwrite kubernetes-cli