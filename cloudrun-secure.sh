echo "Deploying Cloud Run End Point in Secure Mode"

export ID_TOKEN=$(gcloud auth print-identity-token)

gcloud run deploy zoo-mcp-server \
    --no-allow-unauthenticated \
    --region=europe-west1 \
    --source=. \
    --labels=dev-tutorial=codelab-gde-medium-secure
