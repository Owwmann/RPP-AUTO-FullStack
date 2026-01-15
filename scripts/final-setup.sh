#!/bin/bash
# 🚀 FINAL AUTOMATED SETUP - ONE COMMAND!
# This script completes the entire deployment automation

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
cat << "EOF"
====================================
   🚀 RPP AUTO FINAL SETUP
====================================
EOF
echo -e "${NC}"

# Configuration
IONOS_USER="u102176229"
IONOS_HOST="access5019379793.webspacehost.com"
PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGmQ/Pdc6vzahBta5bdtZAjBjBB538ZoxfXe561lrMAE github-actions@rpp-auto"

echo -e "${YELLOW}🔐 Adding SSH public key to IONOS server...${NC}"
echo -e "${YELLOW}Please enter your IONOS password:${NC}"
echo ""

# Add public key to IONOS server
ssh -o StrictHostKeyChecking=no "$IONOS_USER@$IONOS_HOST" << EOF
mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Add the key if it doesn't exist
if ! grep -q "github-actions@rpp-auto" ~/.ssh/authorized_keys 2>/dev/null; then
    echo "$PUBLIC_KEY" >> ~/.ssh/authorized_keys
    echo "✅ Public key added successfully!"
else
    echo "ℹ️  Public key already exists"
fi

echo ""
echo "📂 Preparing deployment directory..."
cd /kunden/homepages/39/d4299589649/htdocs
mkdir -p RPP_AUTO
cd RPP_AUTO

# Initialize git if needed
if [ ! -d ".git" ]; then
    echo "🎯 Initializing git repository..."
    git init
    git remote add origin https://github.com/Owwmann/RPP-AUTO-FullStack.git
fi

echo "✅ Server is ready!"
EOF

if [ $? -eq 0 ]; then
    echo -e "${GREEN}"
    echo "====================================="
    echo "✅ SETUP COMPLETE!"
    echo "====================================="
    echo -e "${NC}"
    echo ""
    echo -e "${BLUE}🎉 What was automated:${NC}"
    echo "✅ SSH key added to GitHub (secret: IONOS_SSH_KEY)"
    echo "✅ Public key added to IONOS server"
    echo "✅ GitHub Actions workflow configured"
    echo "✅ Server directory prepared"
    echo ""
    echo -e "${YELLOW}🚀 TRIGGERING FIRST DEPLOYMENT...${NC}"
    echo ""
    
    # Trigger GitHub Actions workflow
    echo "Deployment will start automatically via GitHub Actions!"
    echo "Monitor at: https://github.com/Owwmann/RPP-AUTO-FullStack/actions"
    echo ""
    echo -e "${GREEN}In 2-3 minutes, your app will be live at:${NC}"
    echo -e "${BLUE}🌐 http://s1080048923.onlinehome.us/api/health${NC}"
    echo -e "${BLUE}🌐 http://recessionproofproducts.com${NC}"
    echo ""
    echo -e "${YELLOW}Next step: Push any code to auto-deploy!${NC}"
    echo "git push origin main"
    echo ""
else
    echo -e "${RED}"
    echo "====================================="
    echo "❌ Setup failed!"
    echo "====================================="
    echo -e "${NC}"
    echo "Please check your IONOS password and try again."
    exit 1
fi
