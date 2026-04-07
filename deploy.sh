#!/bin/bash
set -e

echo "========================================"
echo "🚀 Starting GCP Infrastructure Deployment"
echo "========================================"

deploy_module() {
  local dir=$1
  echo ""
  echo "➡️ Deploying: $dir..."
  
  # Navegar a la carpeta, inicializar y aplicar los cambios
  cd "$dir"
  tofu init
  tofu apply -auto-approve
  cd - > /dev/null
  
  echo "✅ Finished $dir."
}

# Ejecutar recursos uno por uno
deploy_module "01-project"
deploy_module "02-artifact-registry"
deploy_module "03-service-account"
# deploy_module "04-cloud-run"

echo ""
echo "========================================"
echo "🎊 All infrastructure deployed successfully!"
echo "========================================"
