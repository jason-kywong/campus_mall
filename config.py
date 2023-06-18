# coding = utf-8
import os

DEBUG = True

SECRET_KEY = os.urandom(24)
MAX_CONTENT_LENGTH = 16 * 1024 * 1024

# mysql配置
DIALECT = "mysql"
DRIVER = "pymysql"
USERNAME = "root"
PASSWORD = "Aa123456"
HOST = "localhost"
PORT = "3307"
DATABASE = "new_shop"

SQLALCHEMY_DATABASE_URI = "{}+{}://{}:{}@{}:{}/{}?charset=utf8".format(DIALECT, DRIVER, USERNAME, PASSWORD, HOST, PORT,
                                                                       DATABASE)
SQLALCHEMY_TRACK_MODIFICATIONS = False

# 发件邮箱配置

MAIL_SERVER = 'smtp.163.com'
MAIL_PROT = 25
MAIL_USE_TLS = True
MAIL_USE_SSL = False
MAIL_USERNAME = "18948289663@163.com"
MAIL_DEFAULT_SENDER = "18948289663@163.com"
MAIL_PASSWORD = "ADNJGBPMWOGYOFKI"
MAIL_DEBUG = True

# redis配置
REDIS_HOST = "localhost"
REDIS_PORT = 6379

# 七牛云配置
ALLOWED_EXT=set(['png', 'jpg','jpeg','bmp','gif'])
QINIU_ACCESS_KEY = "VimNicRPXX26IBrlzm8L0jfYZlW8hkDy7m6rI-Ik"
QINIU_SECRET_KEY = "UT6U7JX6G2SrqecagTUh_lzFN--RB6lx6XzGGV6V"
QINIU_BUCKET_NAME = 'tongjimall'
QINIU_URL = "http://rvpkzi39r.hd-bkt.clouddn.com"