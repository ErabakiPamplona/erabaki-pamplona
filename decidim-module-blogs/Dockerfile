FROM decidim/decidim:0.8-dev

RUN apt-get update -qq && \
    apt-get install -y sudo && \
    apt-get clean

RUN adduser --home /code --shell /bin/bash --disabled-password --gecos "" decidim && \
    adduser decidim sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo "Defaults:decidim !requiretty"
