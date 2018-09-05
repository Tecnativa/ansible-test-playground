# This image will let you test your ansible roles and playbooks
FROM alpine
ENTRYPOINT [ "/usr/local/bin/lifecycle" ]

# By default, it will run twice each playbook
ENV TEST_ROUNDS 2
# By default, the 2nd round will make the idempotence test
ENV IDEMPOTENT_ROUND 2
# As a convention, default to this inventory file
ENV ANSIBLE_INVENTORY inventory.cfg

# Mount your tested role in /role; it should have a ./tests folder
WORKDIR /role/tests

# Add code and dependencies
RUN apk --no-cache add \
    expect \
    fish \
    libffi \
    openssl \
    python3
RUN apk --no-cache add -t .build \
    build-base \
    libffi-dev \
    openssl-dev \
    python3-dev \
  && pip3 --no-cache-dir install ansible docker \
  && apk del .build
COPY lifecycle /usr/local/bin/lifecycle
