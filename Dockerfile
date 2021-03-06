ARG BEANSTALKD_VERSION=1.12

FROM gcc:10 as build

ARG BEANSTALKD_VERSION

ADD https://github.com/beanstalkd/beanstalkd/archive/v$BEANSTALKD_VERSION.tar.gz /beanstalkd.tgz

WORKDIR /beanstalkd

RUN tar xvfz /beanstalkd.tgz 

WORKDIR /beanstalkd/beanstalkd-$BEANSTALKD_VERSION

RUN make

RUN cp beanstalkd /beanstalkd-bin \
    && chmod 555 /beanstalkd-bin

RUN mkdir /data

FROM gcr.io/distroless/base:nonroot

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG BEANSTALKD_VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="beanstalkd-distroless" \
    org.label-schema.description="Distroless container for the beanstalkd program" \
    org.label-schema.url="https://guillaumedsde.gitlab.io/beanstalkd-distroless/" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.version=$BEANSTALKD_VERSION \
    org.label-schema.vcs-url="https://github.com/guillaumedsde/beanstalkd-distroless" \
    org.label-schema.vendor="guillaumedsde" \
    org.label-schema.schema-version="1.0"

COPY --from=build --chown=nonroot:nonroot /beanstalkd-bin /beanstalkd

VOLUME /data

# Copy empty directory to /data and /config volumes
# to fix permissions until this is fixed:
# https://github.com/moby/moby/issues/2259
COPY --chown=nonroot:nonroot --from=build /data /data

WORKDIR /data

ENTRYPOINT [ "/beanstalkd" ]

EXPOSE 11300
