FROM adoptopenjdk/openjdk8:alpine

ENV VERSION_SDK_TOOLS=4333796

ENV ANDROID_HOME=/usr/local/android-sdk-linux
ENV PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
# For Gradle (not to do fancy terminal stuff and just print plain output)
ENV TERM=dumb

# Install dependencies
RUN apk add --no-cache bash curl git openssl openssh-client ca-certificates

# Install Android SDK
RUN mkdir -p $ANDROID_HOME
RUN wget -q -O sdk.zip http://dl.google.com/android/repository/sdk-tools-linux-$VERSION_SDK_TOOLS.zip
RUN unzip sdk.zip -d $ANDROID_HOME
RUN rm -f sdk.zip

# Accept licenses
RUN yes | sdkmanager --update
RUN yes | sdkmanager --licenses