FROM turistforeningen/postgis

# Install xzip
RUN apt-get update && apt-get install -y --no-install-recommends \
        xz-utils \
        groff

# Install AWS cli
RUN pip install awscli

# Set up app dir
RUN mkdir -p /backup
WORKDIR /backup
COPY . /backup
