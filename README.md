# xiaomiqiu
#### 运行容器 
方式 1：docker run（最常用）
```
docker run -it \
  -e SERVER_ADDR=ngrok.xiaomiqiu123.top:5432 \
  -e AUTH_TOKEN=你的token \
  xiaomiqiu:latest
```

或docker-compose（推荐）

```
services:
  xiaomiqiu:
    image: xiaomiqiu:latest
    environment:
      - SERVER_ADDR=ngrok.xiaomiqiu123.top:5432
      - AUTH_TOKEN=你的token
    restart: always
```


