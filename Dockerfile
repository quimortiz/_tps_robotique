FROM python:3.9

RUN useradd -m user
USER user
WORKDIR /home/user
ENV PATH /home/user/.local/bin:$PATH
CMD jupyter notebook

ADD requirements.txt .
RUN --mount=type=cache,sharing=locked,uid=1000,gid=1000,target=/home/user/.cache \
    python -m pip install --user -U pip \
 && python -m pip install --user -r requirements.txt

ADD . .
