FROM bitnami/kubectl:1.21.1

LABEL maintainer "Michael Joseph Walsh <github.com@nemonik.com>"
LABEL base-on-the-work-of "Sinlead <opensource@sinlead.com>"

COPY init-kubectl kubectl /opt/sinlead/kubectl/bin/

USER root

ENV PATH="/opt/sinlead/kubectl/bin:$PATH"

ENTRYPOINT ["kubectl"]

CMD ["--help"]
