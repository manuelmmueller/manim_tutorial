FROM docker.io/drsalmno/manimslides:e86371a60bc669b4c5d822d79247ebd16e34684077f5e018c3d41aabfaacc10e

COPY --chown=manimuser:manimuser . /manim
