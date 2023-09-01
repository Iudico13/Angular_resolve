FROM tensorflow/tensorflow:latest-gpu

WORKDIR /tf-droplet

ENV TF_CPP_MIN_LOG_LEVEL=2

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libvips-dev


COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8888

ENTRYPOINT [ "jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser" ]
