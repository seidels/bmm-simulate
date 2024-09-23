# Use the official Haskell image as the base
FROM haskell:8

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    libtinfo5 \
    libopenblas-dev \
    liblapack-dev && \
    rm -rf /var/lib/apt/lists/*  # Clean up APT cache to reduce image size


# Install Stack version 2.15.3
RUN wget https://github.com/commercialhaskell/stack/releases/download/v2.15.3/stack-2.15.3-linux-x86_64.tar.gz \
    && tar -xzf stack-2.15.3-linux-x86_64.tar.gz \
    && mv stack-2.15.3-linux-x86_64/stack /usr/local/bin/stack \
    && rm -rf stack-2.15.3-linux-x86_64*  # Clean up

# Install GHC 8.2.2
RUN wget https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-deb8-linux.tar.xz \
    && tar -xf ghc-8.2.2-x86_64-deb8-linux.tar.xz \
    && cd ghc-8.2.2 \
    && ./configure \
    && make install \
    && cd .. \
    && rm -rf ghc-8.2.2 ghc-8.2.2-x86_64-deb8-linux.tar.xz  # Clean up installation files

# Set working directory
WORKDIR /usr/src/bmm-simulate

# Add your Haskell project files to the Docker image
ADD . /usr/src/bmm-simulate/

# Build the Haskell project using Stack
RUN stack build

# Default command to run your application
CMD ["stack", "install" ]

# Copy the built executable to a directory in the PATH
RUN cp $(stack path --local-install-root)/bin/bmm-simulate /usr/local/bin/

