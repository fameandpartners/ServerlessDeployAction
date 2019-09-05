FROM microsoft/dotnet:2.1-sdk

LABEL version="1.0.0"

LABEL com.github.actions.name="CloudFormation Deploy Action"
LABEL com.github.actions.description="Deploy AWS CloudFormation Stack"
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="orange"

LABEL repository="https://github.com/lijinglun-1/ServerlessDeployAction"
LABEL homepage="https://github.com/lijinglun-1/ServerlessDeployAction"

WORKDIR /app/Fame.ImageGenerator
RUN echo $STAGE
RUN apt-get update
RUN apt-get install -y serverless 
RUN serverless plugin install --name serverless-apigw-binary
RUN serverless plugin install --name serverless-domain-manager
RUN ./build.sh

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
