FROM google/cloud-sdk:256.0.0-alpine

ENV HELM_VERSION="v3.1.1"

RUN gcloud components install beta --quiet
RUN apk add gettext jq wget openssl --no-cache
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN git config --global url."git@gitlab.id.vin:".insteadOf "https://gitlab.id.vin/"
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sh
