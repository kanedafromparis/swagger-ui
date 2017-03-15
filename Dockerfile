#
# Runs a static site using uhttpd as a non-root user
#
FROM        progrium/busybox

RUN opkg-install uhttpd

USER default
ADD . /www

EXPOSE 8080
CMD [""]
ENTRYPOINT ["/usr/sbin/uhttpd", "-f", "-p", "8080", "-h", "/www"]

CMD exec nginx -g 'daemon off;'
