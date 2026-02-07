# Use the official PostgreSQL image from the Docker Hub
FROM postgres:18.1-trixie

# Set environment variables
ENV POSTGRES_DB=famdb
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=password

# Copy the schema SQL file to Docker container
COPY dump/0_schema.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432
