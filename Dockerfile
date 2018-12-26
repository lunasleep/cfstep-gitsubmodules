FROM alpine/git:latest

COPY script/updategitsubmodules.sh /updategitsubmodules.sh
RUN ls -alh /

ENTRYPOINT ["sh", "/updategitsubmodules.sh"]