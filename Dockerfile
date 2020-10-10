FROM lpenz/raspbian-buster-armhf-minbase

# install debian packages:
ENV DEBIAN_FRONTEND noninteractive
RUN set -e -x; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        devscripts equivs git-buildpackage \
        locales

COPY entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]
