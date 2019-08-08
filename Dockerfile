# FROM Image replaceable with other indicoio python-docker-packages
# (includes other versions of alpine & ubuntu & ubuntu-gpu)
FROM indicoio/alpine:3.9.3

# Your Github Access Token
ARG GITHUB_ACCESS_TOKEN

LABEL author="{{author}}"
LABEL email="{{email}}"

ENV PATH=/{{package}}/bin:/indipoc/bin:${PATH}

RUN apk update && \
    install_github_dependencies indipoc && \
    install_github_dependencies IndicoIo-python

COPY . /{{package}}
WORKDIR /{{package}}

ARG INDIPOC_TAG=master
ARG INDICOIO_PYTHON_TAG=master

RUN update_github_dependencies indipoc ${INDIPOC_TAG} && \
    update_github_dependencies IndicoIo-python ${INDICOIO_PYTHON_TAG} && \
    pip3 install --find-links=/root/.cache/pip/wheels -e . && \
    python3 setup.py develop --no-deps

CMD ["bash"]
