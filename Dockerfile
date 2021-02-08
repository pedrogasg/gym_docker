FROM tensorflow/tensorflow:2.4.1-gpu

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    libgles2 \
    libxext6 \
    libx11-6 \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
  && apt-get install -y python-opengl \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
  && pip install gym fire tensorflow matplotlib

WORKDIR /gym

COPY ./src .

CMD [ "python", "cartpole/random_move.py" ]