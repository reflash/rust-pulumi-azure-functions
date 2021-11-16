# Build executable
rustup target add x86_64-unknown-linux-musl
cargo build --release --target=x86_64-unknown-linux-musl
cp target/x86_64-unknown-linux-musl/release/handler .

# Login
# If any issues - open the port in the container manually (see the one browser tries to access)
az login

# Function app and storage account names must be unique.
storageName=ruststorage$RANDOM
functionAppName=rust-azure-func$RANDOM
resourceGroup=rust-azure-ResourceGroup
region=westeurope

# Create a resource group.
az group create --name $resourceGroup --location $region

# Create an Azure storage account in the resource group.
az storage account create \
  --name $storageName \
  --location $region \
  --resource-group $resourceGroup \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
az functionapp create \
  --name $functionAppName \
  --storage-account $storageName \
  --consumption-plan-location $region \
  --resource-group $resourceGroup \
  --os-type Linux \
  --runtime custom \
  --functions-version 3

# Deploy function app
func azure functionapp publish $functionAppName

# NOTE: Invoke url is being output with lowercase letters - should be /api/HttpExample