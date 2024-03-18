FROM alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr

# Install vsftpd
RUN apk update && apk upgrade && apk add --no-cache vsftpd

# Create an ftp directory
RUN mkdir /ftp

# Set permissions for the ftp directory
RUN chmod 555 /ftp
# Configure vsftpd
# seccomp_sandbox=NO is mandatory on alpine cf stackoverflow
RUN echo "listen=YES" >> /etc/vsftpd.conf && \
    echo "anonymous_enable=YES" >> /etc/vsftpd.conf && \
    echo "anon_root=/ftp" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "local_umask=022" >> /etc/vsftpd.conf && \
    echo "dirmessage_enable=YES" >> /etc/vsftpd.conf && \
    echo "use_localtime=YES" >> /etc/vsftpd.conf && \
    echo "xferlog_enable=YES" >> /etc/vsftpd.conf && \
    echo "xferlog_file=/var/log/vsftpd.log" >> /etc/vsftpd.conf && \
    echo "seccomp_sandbox=NO" >> /etc/vsftpd.conf && \
    echo "connect_from_port_20=YES" >> /etc/vsftpd.conf && \
    echo "xferlog_std_format=YES" >> /etc/vsftpd.conf && \
    echo "ascii_upload_enable=YES" >> /etc/vsftpd.conf && \
    echo "ascii_download_enable=YES" >> /etc/vsftpd.conf && \
    echo "pasv_enable=YES" >> /etc/vsftpd.conf && \
    echo "pasv_min_port=21100" >> /etc/vsftpd.conf && \
    echo "pasv_max_port=21110" >> /etc/vsftpd.conf && \
    echo "pam_service_name=vsftpd" >> /etc/vsftpd.conf

# Expose FTP port
EXPOSE 21 21100-21110

# Start vsftpd in the foreground
ENTRYPOINT ["/usr/sbin/vsftpd","/etc/vsftpd.conf"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
