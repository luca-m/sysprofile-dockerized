FROM ubuntu:18.04

LABEL maintainer="luca-m" \
    org.label-schema.license="GPLv3" \
    org.label-schema.vendor=""\
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="sysprofiler" \
    org.label-schema.description="dockerized version of the sysprofiler forensic tool by khyrenz" \
    org.label-schema.url="" \
    org.label-schema.vcs-url="" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.usage="docker run -ti -v YOURPATH_TO_RAW_DISK_IMAGE_FOLDER/:/tmp/images sysprofiler:1.0 ./sysprofiler.sh -i /tmp/images/YOURDISK.raw" \
    org.label-schema.docker.cmd="docker run" \ 
    org.label-schema.schema-version="1.0" \
    org.label-schema.version=$VERSION

# Environment configuration
ENV D_USER=user 
ENV D_USER_UID=1000 
ENV D_USER_GID=1000

RUN echo "[+] Updating the system repositories" 
RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' /etc/apt/apt.conf.d/docker-clean 

RUN echo "[+] Preparing user folder" 
RUN groupadd -g 1000 -o user ; useradd -m -u 1000 -g user -o -s /bin/bash user 
RUN mkdir -p /home/user ; chown user:user -R /home/user 

COPY ./ /home/user
WORKDIR /home/user

RUN chown root -R /home/user/

RUN echo "[+] Installing sysprofiler dependencies" 
RUN bash ./sysprofiler-setup.sh

CMD ["/home/user/sysprofiler.sh"]
