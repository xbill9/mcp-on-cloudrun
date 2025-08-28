# mcp-on-cloudrun

This project implements a "Zoo Animal MCP Server" using the FastMCP library. The server provides a simple API to query information about zoo animals. It's designed to be deployed on Google Cloud Run.

## Project Summary

The server is built with Python and the `fastmcp` library. It defines a collection of zoo animals and exposes the following functionalities:

*   **Get animals by species:** Retrieves a list of animals belonging to a specific species.
*   **Get animal details:** Retrieves the details of a specific animal by its name.
*   **Find animal location:** A prompt-based function to find the exhibit and trail of an animal.

The project is configured for easy deployment to Google Cloud Run.

## Shell Scripts

This project includes several shell scripts to facilitate setup, deployment, and management of the Cloud Run service.

### `init.sh`

This script initializes the Google Cloud environment for the project. It performs the following actions:

*   Prompts the user for their Google Cloud project ID and saves it to `~/project_id.txt`.
*   Sets the Google Cloud project in the `gcloud` configuration.
*   Enables the required Google Cloud services (Cloud Run, Artifact Registry, Cloud Build).
*   Adds the necessary IAM roles for the user.
*   Handles authentication for different environments (Google Cloud Shell, local machine, etc.).

**Usage:**

```bash
./init.sh
```

### `set_env.sh`

This script sets various Google Cloud related environment variables required for the project. It reads the project ID from `~/project_id.txt` and exports variables like `PROJECT_ID`, `PROJECT_NUMBER`, `SERVICE_ACCOUNT_NAME`, `GOOGLE_CLOUD_LOCATION`, `REGION`, and `ID_TOKEN`.

**Important:** This script must be sourced, not executed directly, to make the environment variables available in your current shell.

**Usage:**

```bash
source ./set_env.sh
```

### `cloudrun.sh`

This script deploys the application to Google Cloud Run. The service will be named `zoo-mcp-server` and will be publicly accessible.

**Usage:**

```bash
./cloudrun.sh
```

### `cloudrun-secure.sh`

This script deploys the application to Google Cloud Run with a secure configuration. The service will not be publicly accessible, and requests will need to be authenticated with an identity token.

**Usage:**

```bash
./cloudrun-secure.sh
```

### `getlogs.sh`

This script retrieves the latest logs for the `zoo-mcp-server` service from Google Cloud Run.

**Usage:**

```bash
./getlogs.sh
```

## Deployment

To deploy the application to Google Cloud Run, follow these steps:

1.  **Initialize the environment:**

    ```bash
    ./init.sh
    ```

2.  **Set the environment variables:**

    ```bash
    source ./set_env.sh
    ```

3.  **Deploy the application:**

    *   For public access:

        ```bash
        ./cloudrun.sh
        ```

    *   For a secure deployment:

        ```bash
        ./cloudrun-secure.sh
        ```
