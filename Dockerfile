FROM travisci/ci-connie:packer-1512502287-986baf0

COPY assets/build.sh /assets/build.sh
USER travis
RUN bash -l /assets/build.sh
#CMD [ 'joshuacox', 'reactionetes', 'master' ]
#ENTRYPOINT [ '/assets/start.sh' ]
COPY assets/start.sh /assets/start.sh
CMD [ '/bin/bash' ]
