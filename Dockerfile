FROM microsoft/dotnet:2.1-sdk

LABEL version="1.0.0"

LABEL com.github.actions.name="CloudFormation Deploy Action"
LABEL com.github.actions.description="Deploy AWS CloudFormation Stack"

ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
