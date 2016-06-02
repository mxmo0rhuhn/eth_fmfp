FROM debian:jessie

MAINTAINER Max Schrimpf <code@schrimpf.ch>

ENV IMAGE_USER="spin"
ENV WORKSPACE_LOCATION="/workspace"

ENV SPIN_LOCATION="http://spinroot.com/spin/Bin/spin645_linux64.gz"
COPY run_spin.sh /usr/local/bin/sp

RUN groupadd $IMAGE_USER \
    && useradd $IMAGE_USER -s /bin/bash -m -g $IMAGE_USER -G $IMAGE_USER \
    && mkdir $WORKSPACE_LOCATION \
    && chown $IMAGE_USER:$IMAGE_USER $WORKSPACE_LOCATION \
    && cd /tmp \
    && apt-get update \
    && apt-get install -y  \
       curl \
       gcc \
    && apt-get clean \
    cd /tmp \
    && curl -fsSL -o spin.gz $SPIN_LOCATION \
    && gunzip spin.gz \
    && cp spin /usr/local/bin/spin \
    && chmod +x /usr/local/bin/spin \
    && chmod +x /usr/local/bin/sp \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "echo 'Run a random execution:       spin <pml_name>.pml'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Create all possible states    spin -a <pml_name>.pml'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Build:                        gcc -o <out_name> -march=corei7 -O2 -pipe pan.c'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'All in one:                   sp <pml_name>'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'View trail file:              spin -t <pml_name>.pml'" >> /home/$IMAGE_USER/.bashrc 

USER $IMAGE_USER

VOLUME ["$WORKSPACE_LOCATION"]
WORKDIR /$WORKSPACE_LOCATION

CMD ["/bin/bash"]
