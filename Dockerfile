ARG BASEIMAGE=node:22.6.0-bookworm
FROM ${BASEIMAGE}

WORKDIR /home/theia
ADD package.json ./package.json

RUN apt-get update && \
    apt-get install -y python3-pip libsecret-1-dev sudo chromium
RUN pip install --break-system-packages setuptools
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
RUN yarn --pure-lockfile && \
    yarn theia build && \
    yarn theia download:plugins && \
    yarn --production

# Change the users name to user instead of node
RUN usermod -l user node
RUN groupmod -n user node
RUN usermod -aG sudo user
# Remove user password and allow sudo without password
RUN passwd --delete user
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chmod g+rw /home && \
    mkdir -p /home/project && \
    chown -R user:user /home/theia && \
    chown -R user:user /home/project;

ENV HOME /home/theia
WORKDIR /home/theia

ENV SHELL=/bin/bash THEIA_DEFAULT_PLUGINS=local-dir:/home/theia/plugins
ENV USE_LOCAL_GIT=true
ENV NODE_OPTIONS=--max_old_space_size=4096
# Makes the terminal prompt nicer


ADD install_plugins.sh /home/theia/install_plugins.sh

USER user

ENV USERNAME=user
# We use an environment variable so we can change it in the future
# if we want the users name to match their profile name
RUN echo 'export PS1="${USERNAME}:\w\$ "' >> /home/theia/.bash_profile

ENTRYPOINT [ "node", "/home/theia/src-gen/backend/main.js", "/home/project", "--hostname=0.0.0.0" ]