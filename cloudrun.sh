echo "Deploying Cloud Run Endpoint in Unauthenticated Mode"

gcloud run deploy zoo-mcp-server \
    --allow-unauthenticated \
    --region=europe-west1 \
    --source=. \
    --labels=dev-tutorial=codelab-mcp
