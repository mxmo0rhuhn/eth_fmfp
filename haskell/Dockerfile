FROM debian:jessie

MAINTAINER Max Schrimpf <code@schrimpf.ch>

ENV IMAGE_USER="haskell"
ENV WORKSPACE_LOCATION="/workspace"

RUN groupadd $IMAGE_USER \
    && useradd $IMAGE_USER -s /bin/bash -m -g $IMAGE_USER -G $IMAGE_USER \
    && mkdir $WORKSPACE_LOCATION \
    && chown $IMAGE_USER:$IMAGE_USER $WORKSPACE_LOCATION \
    && apt-get -y update \
    && apt-get install -y haskell-platform \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "echo 'Build:                        ghc -o <out_name> <in_file>.hs'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Run interactive:              ghci'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Load file in ghci             :l[oad]'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Repeat last command in ghci   :r[eload]'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Get type of element in ghci   :t[ype]'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Load module into ghci         :module'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Display statistics in ghci    :set +s'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Run shell command in ghci     :! <cmd>'" >> /home/$IMAGE_USER/.bashrc \
    && echo "echo 'Quit ghci                     :q[uit]'" >> /home/$IMAGE_USER/.bashrc 

USER $IMAGE_USER

VOLUME ["$WORKSPACE_LOCATION"]
WORKDIR /$WORKSPACE_LOCATION

CMD ["/bin/bash"]
