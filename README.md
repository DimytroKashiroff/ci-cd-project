Hello docker

sudo docker-compose build --no-cache
sudo docker-compose up

root@dmytro-VirtualBox:/home/dmytro/ci-cd-project/efk-bot# sudo docker-compose build --no-cache
elasticsearch uses an image, skipping
kibana uses an image, skipping
Building fluentd
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon  8.704kB
Step 1/4 : FROM fluent/fluentd:v1.14-1
 ---> 6fb89747f3b4
Step 2/4 : USER root
 ---> Running in 5a01ec85f52d
 ---> Removed intermediate container 5a01ec85f52d
 ---> a1734ce6f598
Step 3/4 : RUN gem install fluent-plugin-elasticsearch --no-document
 ---> Running in 99cef5820ff8
ERROR:  Error installing fluent-plugin-elasticsearch:
	The last version of faraday-net_http (>= 2.0, < 3.5) to support your Ruby & RubyGems was 3.0.2. Try installing it with `gem install faraday-net_http -v 3.0.2` and then running the current command again
	faraday-net_http requires Ruby version >= 3.0.0. The current ruby version is 2.7.6.219.
Successfully installed multi_json-1.15.0
Successfully installed net-http-0.6.0
The command '/bin/sh -c gem install fluent-plugin-elasticsearch --no-document' returned a non-zero code: 1
ERROR: Service 'fluentd' failed to build : Build failed
root@dmytro-VirtualBox:/home/dmytro/ci-cd-project/efk-bot# sudo docker-compose up
Building bot
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon  8.704kB
Step 1/7 : FROM python:3.11-slim
3.11-slim: Pulling from library/python
254e724d7786: Pull complete 
eb0baa05daea: Pull complete 
457229a5b852: Pull complete 
b658f584ba6e: Pull complete 
Digest: sha256:9c85d1d49df54abca1c5db3b4016400e198e9e9bb699f32f1ef8e5c0c2149ccf
Status: Downloaded newer image for python:3.11-slim
 ---> bea8499a31bb
Step 2/7 : WORKDIR /app
 ---> Running in 0a205fe8aeed
 ---> Removed intermediate container 0a205fe8aeed
 ---> 668ac19c82a0
Step 3/7 : COPY bot.py .
 ---> 593c2527133c
Step 4/7 : COPY requirements.txt .
 ---> dbe83d21ac08
Step 5/7 : RUN pip install --no-cache-dir -r requirements.txt
 ---> Running in 3aaa95917f3b
Collecting requests==2.26.0 (from -r requirements.txt (line 1))
  Downloading requests-2.26.0-py2.py3-none-any.whl.metadata (4.8 kB)
Collecting flask==2.0.2 (from -r requirements.txt (line 2))
  Downloading Flask-2.0.2-py3-none-any.whl.metadata (3.8 kB)
Collecting urllib3<1.27,>=1.21.1 (from requests==2.26.0->-r requirements.txt (line 1))
  Downloading urllib3-1.26.20-py2.py3-none-any.whl.metadata (50 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 50.1/50.1 kB 1.5 MB/s eta 0:00:00
Collecting certifi>=2017.4.17 (from requests==2.26.0->-r requirements.txt (line 1))
  Downloading certifi-2025.4.26-py3-none-any.whl.metadata (2.5 kB)
Collecting charset-normalizer~=2.0.0 (from requests==2.26.0->-r requirements.txt (line 1))
  Downloading charset_normalizer-2.0.12-py3-none-any.whl.metadata (11 kB)
Collecting idna<4,>=2.5 (from requests==2.26.0->-r requirements.txt (line 1))
  Downloading idna-3.10-py3-none-any.whl.metadata (10 kB)
Collecting Werkzeug>=2.0 (from flask==2.0.2->-r requirements.txt (line 2))
  Downloading werkzeug-3.1.3-py3-none-any.whl.metadata (3.7 kB)
Collecting Jinja2>=3.0 (from flask==2.0.2->-r requirements.txt (line 2))
  Downloading jinja2-3.1.6-py3-none-any.whl.metadata (2.9 kB)
Collecting itsdangerous>=2.0 (from flask==2.0.2->-r requirements.txt (line 2))
  Downloading itsdangerous-2.2.0-py3-none-any.whl.metadata (1.9 kB)
Collecting click>=7.1.2 (from flask==2.0.2->-r requirements.txt (line 2))
  Downloading click-8.2.0-py3-none-any.whl.metadata (2.5 kB)
Collecting MarkupSafe>=2.0 (from Jinja2>=3.0->flask==2.0.2->-r requirements.txt (line 2))
  Downloading MarkupSafe-3.0.2-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (4.0 kB)
Downloading requests-2.26.0-py2.py3-none-any.whl (62 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 62.3/62.3 kB 6.5 MB/s eta 0:00:00
Downloading Flask-2.0.2-py3-none-any.whl (95 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 95.2/95.2 kB 8.1 MB/s eta 0:00:00
Downloading certifi-2025.4.26-py3-none-any.whl (159 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 159.6/159.6 kB 15.4 MB/s eta 0:00:00
Downloading charset_normalizer-2.0.12-py3-none-any.whl (39 kB)
Downloading click-8.2.0-py3-none-any.whl (102 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 102.2/102.2 kB 60.1 MB/s eta 0:00:00
Downloading idna-3.10-py3-none-any.whl (70 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 70.4/70.4 kB 54.7 MB/s eta 0:00:00
Downloading itsdangerous-2.2.0-py3-none-any.whl (16 kB)
Downloading jinja2-3.1.6-py3-none-any.whl (134 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 134.9/134.9 kB 29.4 MB/s eta 0:00:00
Downloading urllib3-1.26.20-py2.py3-none-any.whl (144 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 144.2/144.2 kB 35.1 MB/s eta 0:00:00
Downloading werkzeug-3.1.3-py3-none-any.whl (224 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 224.5/224.5 kB 29.0 MB/s eta 0:00:00
Downloading MarkupSafe-3.0.2-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (23 kB)
Installing collected packages: urllib3, MarkupSafe, itsdangerous, idna, click, charset-normalizer, certifi, Werkzeug, requests, Jinja2, flask
Successfully installed Jinja2-3.1.6 MarkupSafe-3.0.2 Werkzeug-3.1.3 certifi-2025.4.26 charset-normalizer-2.0.12 click-8.2.0 flask-2.0.2 idna-3.10 itsdangerous-2.2.0 requests-2.26.0 urllib3-1.26.20
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

[notice] A new release of pip is available: 24.0 -> 25.1.1
[notice] To update, run: pip install --upgrade pip
 ---> Removed intermediate container 3aaa95917f3b
 ---> b4f1415956b5
Step 6/7 : RUN mkdir -p /fluentd/log
 ---> Running in 46290780d450
 ---> Removed intermediate container 46290780d450
 ---> 1d9328e8268e
Step 7/7 : CMD ["python", "bot.py"]
 ---> Running in 9a5629f0bb9e
 ---> Removed intermediate container 9a5629f0bb9e
 ---> cedff222a3b5
Successfully built cedff222a3b5
Successfully tagged efk-bot_bot:latest
WARNING: Image for service bot was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating efk-bot_elasticsearch_1 ... done
Creating efk-bot_fluentd_1       ... done
Creating efk-bot_kibana_1        ... done
Creating efk-bot_bot_1           ... done
Attaching to efk-bot_elasticsearch_1, efk-bot_kibana_1, efk-bot_fluentd_1, efk-bot_bot_1
fluentd_1        | 2025-05-13 18:15:30 +0000 [info]: parsing config file is succeeded path="/fluentd/etc/fluent.conf"
fluentd_1        | 2025-05-13 18:15:30 +0000 [info]: gem 'fluentd' version '1.14.6'
fluentd_1        | 2025-05-13 18:15:30 +0000 [error]: config error file="/fluentd/etc/fluent.conf" error_class=Fluent::NotFoundPluginError error="Unknown output plugin 'elasticsearch'. Run 'gem search -rd fluent-plugin' to find plugins"
efk-bot_fluentd_1 exited with code 1
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:36,894Z", "level": "INFO", "component": "o.e.n.Node", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "version[7.17.3], pid[6], build[default/docker/5ad023604c8d7416c9eb6c0eadb62b14e766caff/2022-04-19T08:11:19.070913226Z], OS[Linux/6.11.0-24-generic/amd64], JVM[Eclipse Adoptium/OpenJDK 64-Bit Server VM/18/18+36]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:36,900Z", "level": "INFO", "component": "o.e.n.Node", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "JVM home [/usr/share/elasticsearch/jdk], using bundled JDK [true]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:36,901Z", "level": "INFO", "component": "o.e.n.Node", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "JVM arguments [-Xshare:auto, -Des.networkaddress.cache.ttl=60, -Des.networkaddress.cache.negative.ttl=10, -XX:+AlwaysPreTouch, -Xss1m, -Djava.awt.headless=true, -Dfile.encoding=UTF-8, -Djna.nosys=true, -XX:-OmitStackTraceInFastThrow, -XX:+ShowCodeDetailsInExceptionMessages, -Dio.netty.noUnsafe=true, -Dio.netty.noKeySetOptimization=true, -Dio.netty.recycler.maxCapacityPerThread=0, -Dio.netty.allocator.numDirectArenas=0, -Dlog4j.shutdownHookEnabled=false, -Dlog4j2.disable.jmx=true, -Dlog4j2.formatMsgNoLookups=true, -Djava.locale.providers=SPI,COMPAT, --add-opens=java.base/java.io=ALL-UNNAMED, -Djava.security.manager=allow, -XX:+UseG1GC, -Djava.io.tmpdir=/tmp/elasticsearch-9491134795425466820, -XX:+HeapDumpOnOutOfMemoryError, -XX:+ExitOnOutOfMemoryError, -XX:HeapDumpPath=data, -XX:ErrorFile=logs/hs_err_pid%p.log, -Xlog:gc*,gc+age=trace,safepoint:file=logs/gc.log:utctime,pid,tags:filecount=32,filesize=64m, -Des.cgroups.hierarchy.override=/, -Xms1957m, -Xmx1957m, -XX:MaxDirectMemorySize=1026555904, -XX:G1HeapRegionSize=4m, -XX:InitiatingHeapOccupancyPercent=30, -XX:G1ReservePercent=15, -Des.path.home=/usr/share/elasticsearch, -Des.path.conf=/usr/share/elasticsearch/config, -Des.distribution.flavor=default, -Des.distribution.type=docker, -Des.bundled_jdk=true]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,051Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [aggs-matrix-stats]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,051Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [analysis-common]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,051Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [constant-keyword]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,051Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [frozen-indices]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,051Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [ingest-common]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,051Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [ingest-geoip]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,052Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [ingest-user-agent]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,052Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [kibana]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,052Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [lang-expression]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,052Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [lang-mustache]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,052Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [lang-painless]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,053Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [legacy-geo]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,053Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [mapper-extras]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,053Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [mapper-version]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,053Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [parent-join]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,053Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [percolator]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,055Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [rank-eval]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,055Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [reindex]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,055Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [repositories-metering-api]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,055Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [repository-encrypted]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,056Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [repository-url]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,056Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [runtime-fields-common]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,056Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [search-business-rules]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,057Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [searchable-snapshots]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,059Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [snapshot-repo-test-kit]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,059Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [spatial]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,060Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [transform]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,060Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [transport-netty4]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,060Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [unsigned-long]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,060Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [vector-tile]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,060Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [vectors]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,060Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [wildcard]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,061Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-aggregate-metric]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,061Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-analytics]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,061Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-async]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,062Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-async-search]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,063Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-autoscaling]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,063Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-ccr]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,064Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-core]" }
elasticsearch_1  | {"type": "server", "timestamp": "2025-05-13T18:15:41,064Z", "level": "INFO", "component": "o.e.p.PluginsService", "cluster.name": "docker-cluster", "node.name": "3627eb1a05fa", "message": "loaded module [x-pack-data-streams]" }
