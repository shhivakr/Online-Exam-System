# Deployment

This project is a Spring Boot and Thymeleaf application. Deploy the app itself on Render as a free Docker web service. Vercel is only suitable here as an optional free proxy/custom-domain layer that forwards traffic to Render.

## Render

1. Push this repository to GitHub.
2. In Render, create a new Blueprint and select this repository.
3. Render will read `render.yaml` and build the included `Dockerfile`.
4. Deploy the `online-exam-system` service.

The Render blueprint uses the free web service plan with an H2 file database and uploads stored under `/tmp`. This keeps hosting free, but Render's free filesystem is ephemeral: uploaded files and database data can disappear after restarts, redeploys, or instance replacement.

For permanent database and upload storage, you must add a persistent database or storage provider, which may not be fully free.

## Vercel Proxy

1. Deploy the app on Render first.
2. Copy the Render service URL, for example `https://online-exam-system.onrender.com`.
3. In `vercel.json`, replace `https://your-render-service.onrender.com` with your real Render URL.
4. Deploy this repository to Vercel.

Vercel will forward all requests to the Render-hosted Spring Boot app. This project should not be deployed directly as a native Vercel app because it is a long-running Spring Boot server, not a static frontend or Vercel serverless function project.
