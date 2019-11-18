FROM golang:buster

ENV HUGO_VERSION=0.59.1

WORKDIR /tmp
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb && \
    dpkg -i /tmp/hugo_${HUGO_VERSION}_Linux-64bit.deb

WORKDIR /app

COPY . /app/

RUN hugo

# Drop root privileges within the container. From:
# https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b
RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser

EXPOSE 5000

CMD ["hugo", "server", "--bind", "0.0.0.0", "--port", "5000", "--watch", "false", "--disableLiveReload"]

