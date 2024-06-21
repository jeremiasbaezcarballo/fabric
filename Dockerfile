FROM python:3.12

# Install pipx
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade pipx
RUN python -m pipx ensurepath

# Add pipx to PATH
ENV PATH=/root/.local/bin:$PATH

# Fabric environment variables
# ENV OPENAI_API_KEY=value
# ENV CLAUDE_API_KEY=value
# ENV GOOGLE_API_KEY=value
ENV YOUTUBE_API_KEY=AIzaSyA7bZ_h7PYXZTOzGSx1NQntRHHqd5PW-s8

# Set the working directory
WORKDIR /app
COPY . /app/


# Install fabric-api and fabric-webui
RUN pipx install .

# Restart shell
SHELL ["/bin/bash", "-c"]

EXPOSE 80 5000 13337 13338

# Start fabric-api and fabric-webui
CMD ["fabric-api"]
