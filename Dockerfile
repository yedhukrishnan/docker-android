FROM ubuntu:14.04
MAINTAINER Yedhu Krishnan <yedhukrishnan@yahoo.com>

RUN apt-get update

# Install Java
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y openjdk-7-jdk

# Install 32 bit Library
RUN apt-get install -y lib32z1
RUN apt-get install -y lib32ncurses5
RUN apt-get install -y lib32bz2-1.0

# Install CURL and Unzip
RUN apt-get install -y curl
RUN apt-get install -y unzip

# Install Android SDK
RUN cd /usr/local/ && curl -L -O http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xf android-sdk_r24.4.1-linux.tgz

# Install Android tools
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter tools 
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter platform-tools 
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter build-tools-23.0.1 
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter android-23 
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter android-19 
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter extra 
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter sys-img-armeabi-v7a-android-19 

# Install Gradle
RUN cd /usr/local/ && curl -L -O http://services.gradle.org/distributions/gradle-2.2.1-all.zip && unzip -o gradle-2.2.1-all.zip

# Environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk
ENV ANDROID_HOME /usr/local/android-sdk-linux

ENV GRADLE_HOME /usr/local/gradle-2.2.1
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$ANT_HOME/bin
ENV PATH $PATH:$MAVEN_HOME/bin
ENV PATH $PATH:$GRADLE_HOME/bin

RUN rm -rf /usr/local/android-sdk_r24.4.1-linux.tgz
RUN rm -rf /usr/local/android-ndk-r9b-linux-x86_64.tar.bz2
RUN rm -rf /usr/local/apache-ant-1.9.6-bin.tar.gz
RUN rm -rf /usr/local/apache-maven-3.1.1-bin.tar.gz
RUN rm -rf /usr/local/gradle-2.2.1-all.zip
