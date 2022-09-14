FROM shipyardrun/hashicorp-tools:v0.10.0 as base

FROM base AS image-amd64

RUN apt-get update && apt-get install -y \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

FROM base AS image-arm64

RUN apt-get update && apt-get install -y \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

FROM image-${TARGETARCH}

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
ARG BUILDPLATFORM
ARG BUILDARCH

RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM $TARGETARCH $TARGETVARIANT"