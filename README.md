# LibclusterGossipIssue

This repo needs docker compose (`docker-compose` or `docker compose` when using the new cli plugin).

### Working on 25.0.4

```bash
$ docker-compose up -d --build
$ docker-compose exec node_a /app/server remote
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Interactive Elixir (1.14.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(libcluster_gossip_issue@fa420a7895bb)1> Node.list
[:libcluster_gossip_issue@dcbd7e6954f3]
iex(libcluster_gossip_issue@fa420a7895bb)2>
```

Stop using `docker-compose down`.

### Not working on 25.1

```bash
$ docker-compose -f docker-compose.broken.yml up -d --build
$ docker-compose -f docker-compose.broken.yml exec node_a /app/server remote
Erlang/OTP 25 [erts-13.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Interactive Elixir (1.14.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(libcluster_gossip_issue@55f3785d8c37)1> Node.list
[]
iex(libcluster_gossip_issue@55f3785d8c37)2>
```

Stop using `docker-compose -f docker-compose.broken.yml down`
