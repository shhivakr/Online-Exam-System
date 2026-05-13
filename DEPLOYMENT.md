# Deployment

This project is a Spring Boot and Thymeleaf application. Deploy the app itself on Render as a Docker web service. Vercel is only suitable here as an optional proxy/custom-domain layer that forwards traffic to Render.

## Render

1. Push this repository to GitHub.
2. In Render, create a new Blueprint and select this repository.
3. Render will read `render.yaml` and build the included `Dockerfile`.
4. Deploy the `online-exam-system` service.

The Render blueprint uses an H2 file database and stores uploads on a persistent disk at `/var/data`. Render disks require a paid web service instance, so the blueprint uses the `starter` plan. For production, replace the datasource environment variables with a managed database connection.

## Vercel Proxy

1. Deploy the app on Render first.
2. Copy the Render service URL, for example `https://online-exam-system.onrender.com`.
3. In `vercel.json`, replace `https://your-render-service.onrender.com` with your real Render URL.
4. Deploy this repository to Vercel.

Vercel will forward all requests to the Render-hosted Spring Boot app. This project should not be deployed directly as a native Vercel app because it is a long-running Spring Boot server, not a static frontend or Vercel serverless function project.
