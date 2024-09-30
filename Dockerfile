FROM docker.io/manimcommunity/manim:v0.18.1

COPY --chown=manimuser:manimuser . /manim

RUN python3 -m pip install --no-cache-dir notebook jupyterlab
RUN pip install --no-cache-dir jupyterhub

USER root
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
ENV PATH="${HOME}/.local/bin:${PATH}"

USER root
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}


