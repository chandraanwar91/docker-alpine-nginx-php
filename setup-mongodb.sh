# Install mongodb extension
BUILD_DEPS="
    build-base
    autoconf
    gcc
    libc-dev
    file
    binutils
    bison
    readline-dev
    libxml2-dev
    curl-dev
    openssl-dev
    db-dev
    enchant-dev
    expat-dev
    freetds-dev
    gdbm-dev
    gettext-dev
    libevent-dev
    libgcrypt-dev
    libxslt-dev
    unixodbc-dev
    zlib-dev
    krb5-dev
    libical-dev
    libxpm-dev
"

apk --update add ${BUILD_DEPS}

# install mongodb
pecl install mongodb
echo "extension=mongodb.so" > /etc/php7/conf.d/00_mongodb.ini
chmod u+w,a+rx /usr/lib/php7/modules/mongodb.so
enable_ext mongodb

# clean up
cd /
apk del ${BUILD_DEPS}
rm -rf /var/cache/apk/*
rm -rf /tmp/*
