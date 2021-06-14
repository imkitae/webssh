FROM python:3.7-slim
ADD . /code
WORKDIR /code
RUN \
  groupadd -r webssh && \
  useradd -r -s /bin/false -g webssh webssh && \
  chown -R webssh:webssh /code && \
  pip --trusted-host pypi.org --trusted-host files.pythonhosted.org install -r requirements.txt

EXPOSE 8888/tcp
USER webssh
CMD ["python", "run.py"]
