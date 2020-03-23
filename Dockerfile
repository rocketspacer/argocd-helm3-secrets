FROM argoproj/argocd:v1.4.2

# Switch to root user to perform installation
USER root

# Install common dependencies
RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        sudo \
        awscli

# Install Helm 3.1.2
COPY install-helm3.sh .
RUN ./install-helm3.sh --no-sudo --version v3.1.2

# Install Helm Secrets
RUN helm plugin install https://github.com/futuresimple/helm-secrets

# Switch back to argocd user
USER argocd