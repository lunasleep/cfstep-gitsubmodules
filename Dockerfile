FROM alpine/git:latest

COPY script/updategitsubmodules.sh /updategitsubmodules.sh

ENTRYPOINT ["/updategitsubmodules.sh"]