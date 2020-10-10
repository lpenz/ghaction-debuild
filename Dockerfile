# This file is subject to the terms and conditions defined in
# file 'LICENSE', which is part of this source code package.
ARG  OS
ARG  DIST
ARG  ARCH
FROM lpenz/${OS}-${DIST}-${ARCH}-minbase

# Add deb-src's
RUN set -e -x; sed -i 'p;s@^deb @deb-src @' /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
RUN set -e -x; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        devscripts equivs git-buildpackage \
        locales

COPY mk-build-deps-tool /usr/local/bin/mk-build-deps-tool
COPY entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]
