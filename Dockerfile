# 设置基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json到工作目录中
COPY package*.json ./

# 安装依赖项
RUN npm install

# 复制应用程序代码到工作目录中
COPY . .

# 编译应用程序
RUN npm run build

# 设置nginx为基础镜像
FROM nginx:alpine

# 将编译后的应用程序复制到nginx默认的静态文件目录中
COPY --from=0 /app/dist /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动Nginx服务
CMD ["nginx", "-g", "daemon off;"]

