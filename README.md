# 这是我工作中平时经常使用的centos6容器
对centos6加入平时经常使用的工具，去掉工作中的一些敏感信息

## 构建
进入这些文件所在的目录  
`sh startBulidDockerfile.sh`

## 启动容器
`docker-compose up -d`

## 进入容器
xxx为容器id

`docker exec -it xxx /bin/bsh`
