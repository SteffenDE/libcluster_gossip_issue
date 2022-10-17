FROM hexpm/elixir:1.14.1-erlang-25.0.4-debian-bullseye-20220801-slim

WORKDIR /app

ENV MIX_ENV=prod

RUN mix local.hex --force
RUN mix local.rebar --force 

COPY . /app
RUN mix deps.get && mix release

RUN ln -s /app/_build/prod/rel/libcluster_gossip_issue/bin/libcluster_gossip_issue /app/server

ENTRYPOINT [ "/app/server" ]
CMD ["start"]
