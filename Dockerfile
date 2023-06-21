# 设置基础镜像
FROM python:3.7

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器中
COPY . /app

# 安装项目依赖项
RUN pip install --no-cache-dir -r requirements.txt

# 暴露端口（如果你的 Flask 应用程序使用了不同的端口，请相应修改）
EXPOSE 5000

# 设置环境变量
ENV FLASK_APP=your_flask_app.py
ENV FLASK_ENV=development

# 运行 Flask 应用程序
CMD ["flask", "run", "--host=0.0.0.0"]
