FROM ubuntu:20.04
WORKDIR /home

# 直接复制仓库里的文件（不需要下载！）
COPY xiaomiqiu /home/
RUN chmod +x /home/xiaomiqiu

# 启动检查 + 自动生成配置
ENTRYPOINT ["/bin/bash", "-c", "\
set -e;\
if [ -z \"$SERVER_ADDR\" ]; then\n\
    echo -e \"\\033[31mERROR: 必须配置环境变量 SERVER_ADDR\\033[0m\";\n\
    echo '示例: -e SERVER_ADDR=ngrok.xiaomiqiu123.top:5432';\n\
    exit 1;\n\
fi;\n\
if [ -z \"$AUTH_TOKEN\" ]; then\n\
    echo -e \"\\033[31mERROR: 必须配置环境变量 AUTH_TOKEN\\033[0m\";\n\
    echo '示例: -e AUTH_TOKEN=your_token';\n\
    exit 1;\n\
fi;\n\
echo 'server_addr: ' $SERVER_ADDR > xiaomiqiu.conf;\n\
echo 'auth_token: ' $AUTH_TOKEN >> xiaomiqiu.conf;\n\
echo -e \"\\033[32m[+] 配置生成成功\\033[0m\";\n\
./xiaomiqiu -log=stdout -log-level=info start-all;\n\
"]
