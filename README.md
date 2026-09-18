# duckiesfarm.com

This is the source code of https://www.duckiesfarm.com

All publishable files are stored in the `site` directory.

## Run with Docker

The root-level `Dockerfile` packages the contents of `site` in an Nginx image.

Build the image from the repository root:

```bash
docker build -t duckiesfarm .
```

Run the container and publish its port 8080:

```bash
docker run --rm -p 8080:8080 duckiesfarm
```

Open http://localhost:8080 to view the site. Stop the container with `Ctrl+C`.

## Deploy to Azure Static Web Apps

Azure Static Web Apps can deploy this site directly from GitHub. No build step or API backend is required.

1. Push the repository to GitHub.
2. In the [Azure portal](https://portal.azure.com), select **Create a resource**, search for **Static Web App**, and select **Create**.
3. Select the subscription and resource group, enter a name, and choose a hosting plan and region.
4. Under **Deployment details**, select **GitHub**, authorize Azure, and choose the organization, repository, and `main` branch.
5. Under **Build Details**, select **Custom** and use these values:

	| Setting | Value |
	| --- | --- |
	| App location | `site` |
	| API location | Leave empty |
	| Output location | Leave empty |

6. Select **Review + create**, then **Create**. Azure adds a GitHub Actions workflow to the repository and starts the first deployment.
7. Follow the deployment in the repository's **Actions** tab. When it completes, open the URL shown on the Azure Static Web App overview page.

Subsequent pushes to `main` deploy automatically. Pull requests targeting `main` receive temporary preview environments, which Azure removes when the pull request is closed.
