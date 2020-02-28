FROM google/cloud-sdk:256.0.0-alpine

ENV HELM_VERSION="v3.1.1"

RUN gcloud components install beta --quiet
RUN apk add gettext jq wget --no-cache
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN git config --global url."git@gitlab.id.vin:".insteadOf "https://gitlab.id.vin/"
RUN wget -q http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm
