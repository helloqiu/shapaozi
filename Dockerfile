FROM python:3.5.2-slim

COPY . /requirements/

WORKDIR /requirements/

RUN set -x \
    && echo "Asia/Shanghai" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -U pip setuptools \
    && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt \
    && find /usr/local -type f -name '*.pyc' -name '*.pyo' -delete \
    && rm -rf ~/.cache/ \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
