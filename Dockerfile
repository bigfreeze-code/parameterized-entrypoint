ARG DEBIANTAG                       
                                     
FROM debian:${DEBIANTAG} as build
                                     
RUN set -ex \                
  && apt-get update -y \
  && apt-get install -y --no-install-recommends --no-install-suggests \
       git \
       python3 \
       python3-pip \
       python3-setuptools \
       python3-wheel \
       python3-dev \
       binutils \
       build-essential \
       libz-dev \
  && git clone https://github.com/bigfreeze-code/parameterized-entrypoint.git \
  && cd parameterized-entrypoint \
  && pip3 install -r requirements.txt \
  && python3 setup.py build \
  && chmod 755 dist/entrypoint \
  && mv dist/entrypoint /usr/local/bin


FROM scratch

COPY --from=build /usr/local/bin/entrypoint /


