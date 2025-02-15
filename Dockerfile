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

# 启动服务
CMD ["npm", "run", "serve"]

