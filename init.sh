

#!/bin/bash

# --- Function for error handling ---
handle_error() {
  echo "Error: $1"
  exit 1
}

# --- Part 1: Set Google Cloud Project ID ---
cd ~/mcp-on-cloudrun


PROJECT_FILE="$HOME/project_id.txt"
echo "--- Setting Google Cloud Project ID File ---"

read -p "Please enter your Google Cloud project ID: " user_project_id

if [[ -z "$user_project_id" ]]; then
  handle_error "No project ID was entered."
fi

echo "You entered: $user_project_id"
echo "$user_project_id" > "$PROJECT_FILE"

if [[ $? -ne 0 ]]; then
  handle_error "Failed saving your project ID: $user_project_id."
fi

source ./set_env.sh
gcloud config set project $(cat ~/project_id.txt) 
echo "Successfully saved project ID."


echo "Enabling Services"
gcloud services enable \
  run.googleapis.com \
  artifactregistry.googleapis.com \
  cloudbuild.googleapis.com


echo "Adding IAM Roles"
export GOOGLE_CLOUD_PROJECT=$(gcloud config get project)
gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
    --member=user:$(gcloud config get-value account) \
    --role='roles/run.invoker'

echo "Setting ADC Credentials"
gcloud auth application-default login


echo "--- Initial Setup complete ---"

