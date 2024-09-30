RUN python3 -m pip install --no-cache-dir notebook jupyterlab

FROM docker.io/manimcommunity/manim:v0.18.1

COPY --chown=manimuser:manimuser . /manim
