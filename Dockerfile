FROM alpine:3.20.2
ENV EXIFTOOL_VERSION=12.96

VOLUME /app
WORKDIR /app

RUN apk add --no-cache perl make
RUN cd /app \
	&& wget https://exiftool.org/Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& tar -zxvf Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& cd Image-ExifTool-${EXIFTOOL_VERSION} \
	&& perl Makefile.PL \
	&& make test \
	&& make install \
	&& cd .. \
	&& rm -rf Image-ExifTool-${EXIFTOOL_VERSION} \
	&& rm -rf Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz

ENTRYPOINT ["exiftool"]