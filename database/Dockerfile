# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables
ENV POSTGRES_HOST=localhost
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=admin123
ENV POSTGRES_DB=basic3tier

# Expose the PostgreSQL port
EXPOSE 5432

COPY . /postgres-data

VOLUME ["/postgres-data:/var/lib/postgresql/data"]

