FROM python:3.10.13-slim-bullseye
WORKDIR /
RUN apt-get update && \
    apt-get install -y git python3-pip
RUN git clone https://github.com/jiayev/GPT4V-Image-Captioner.git
RUN apt remove -y git
WORKDIR GPT4V-Image-Captioner/
RUN chmod +x gpt-caption.py
RUN pip install -r install_script/requirements.txt
RUN pip install torch
EXPOSE 8848
ENV HF_HOME huggingface
ENTRYPOINT [ "python3", "gpt-caption.py", "--listen", "--share" ]