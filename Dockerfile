FROM indicoio/alpine:3.9.3

LABEL author="{{author}}"
LABEL email="{{email}}"

ARG EXTRAS="[test]"
ENV PATH=/{{package}}/bin:${PATH}

COPY . /{{package}}
WORKDIR /{{package}}

RUN pip3 install --find-links=/root/.cache/pip/wheels -e .${EXTRAS} && \
    python3 setup.py develop --no-deps

CMD ["bash"]
