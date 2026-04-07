#!/bin/bash
set -e

echo "========================================"
echo "🚀 Starting GCP Infrastructure Deployment"
echo "========================================"

echo ""
echo "➡️ Deploying: 01-project..."
cd 01-project
tofu init
tofu apply -auto-approve

# Extraemos el project_id dinámicamente ("notely-*") generado desde los outputs de Terraform
export PROJECT_ID=$(tofu output -raw project_id)
cd - > /dev/null

echo "✅ Finished 01-project. Dynamic Project ID: $PROJECT_ID"

deploy_module() {
  local dir=$1
  echo ""
  echo "➡️ Deploying: $dir con project_id=$PROJECT_ID..."
  
  # Navegar a la carpeta, inicializar y aplicar los cambios inyectando dinámicamente nuestra variable
  cd "$dir"
  tofu init
  tofu apply -auto-approve -var="project_id=$PROJECT_ID"
  cd - > /dev/null
  
  echo "✅ Finished $dir."
}

# Ejecutar recursos uno por uno
deploy_module "02-artifact-registry"
deploy_module "03-service-account"
# deploy_module "04-cloud-run"
# deploy_module "06-secrets"
deploy_module "05-cloud-run-notely"

echo ""
echo "========================================"
echo "🎊 All infrastructure deployed successfully!"
echo "========================================"
