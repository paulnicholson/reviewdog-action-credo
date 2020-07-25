FROM elixir:1.10.2-alpine

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ v0.10.1
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENV MIX_HOME /var/mix

RUN mix local.hex --force && \
    mix archive.install --force github rrrene/bunt && \
    mix archive.install --force github rrrene/credo

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
