# OpenAIOS AILake Spark Base Image

# Ubuntu 20.04 (focal)
# https://hub.docker.com/_/ubuntu/?tab=tags&name=focal
ARG ROOT_CONTAINER=ubuntu:focal

FROM $ROOT_CONTAINER

LABEL maintainer="OpenAIOS AILake Project"

# image default user
ARG NB_USER="ailake"
ARG NB_UID="8000"
ARG NB_GID="100"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

ENV TZ Asia/Shanghai

ENV DEBIAN_FRONTEND noninteractive

ARG OPENJDK_VERSION=11

RUN apt-get update --yes && \
	# - apt-get upgrade is run to patch known vulnerabilities in apt-get packages as
	#   the ubuntu base image is rebuilt too seldom sometimes (less than once a month)
	apt-get upgrade --yes && \
	apt-get install --yes --no-install-recommends \
	# - bzip2 is necessary to extract the micromamba executable.
	bzip2 \
	"openjdk-${OPENJDK_VERSION}-jre-headless" \
	vim-tiny \
	ca-certificates \
	fonts-liberation \
	locales \
	# - run-one - a wrapper script that runs no more
	#   than one unique  instance  of  some  command with a unique set of arguments,
	#   we use `run-one-constantly` to support `RESTARTABLE` option
	run-one \
	tzdata \
	sudo \
	# - tini is installed as a helpful container entrypoint that reaps zombie
	#   processes and such of the actual executable we want to start, see
	#   https://github.com/krallin/tini#why-tini for details.
	tini \
	wget && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
	ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	dpkg-reconfigure -f noninteractive tzdata && \
	locale-gen

# Configure environment
ENV CONDA_DIR=/opt/conda \
	SHELL=/bin/bash \
	NB_USER="${NB_USER}" \
	NB_UID=${NB_UID} \
	NB_GID=${NB_GID} \
	LC_ALL=en_US.UTF-8 \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8

ENV PATH="${CONDA_DIR}/bin:${PATH}" \
	HOME="/home/${NB_USER}"

# Copy a script that we will use to correct permissions after running certain commands
COPY fix-permissions /usr/local/bin/fix-permissions
RUN chmod a+rx /usr/local/bin/fix-permissions

# entrypoint.sh from  spark repo
# https://github.com/apache/spark/blob/master/resource-managers/kubernetes/docker/src/main/dockerfiles/spark/entrypoint.sh
COPY entrypoint.sh /opt/entrypoint.sh 
RUN chmod a+rx /opt/entrypoint.sh

# Create NB_USER with name jovyan user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN echo "auth requisite pam_deny.so" >> /etc/pam.d/su && \
	sed -i.bak -e 's/^%admin/#%admin/' /etc/sudoers && \
	sed -i.bak -e 's/^%sudo/#%sudo/' /etc/sudoers && \
	useradd -l -m -s /bin/bash -N -u "${NB_UID}" "${NB_USER}" && \
	chmod g+w /etc/passwd && \
	fix-permissions "${HOME}" 

USER ${NB_UID}

# Setup work directory for backward-compatibility
RUN mkdir "/home/${NB_USER}/work" && \
	fix-permissions "/home/${NB_USER}"
# Spark installation
# Spark dependencies
# Default values can be overridden at build time
# (ARGS are in lower case to distinguish them from ENV)
ARG spark_version="3.2.1"
ARG hadoop_version="3.2"
ARG spark_checksum="145ADACF189FECF05FBA3A69841D2804DD66546B11D14FC181AC49D89F3CB5E4FECD9B25F56F0AF767155419CD430838FB651992AEB37D3A6F91E7E009D1F9AE"

ENV APACHE_SPARK_VERSION="${spark_version}" \
	HADOOP_VERSION="${hadoop_version}" 

WORKDIR /tmp
USER root

#RUN wget -q "https://archive.apache.org/dist/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" && \
#	echo "${spark_checksum} *spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" | sha512sum -c - && \
#	tar xzf "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" -C /usr/local --owner root --group root --no-same-owner && \
#	rm "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"
COPY spark-3.2.1-bin-hadoop3.2.tgz /tmp/
RUN tar xzf "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" -C /opt/ --owner root --group root --no-same-owner && \
	rm "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"



WORKDIR /opt

# Configure Spark
ENV SPARK_HOME=/opt/spark
ENV SPARK_OPTS="--driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info" \
	PATH="${PATH}:${SPARK_HOME}/bin"

RUN ln -s "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}" spark


# Configure Spark Access S3
# S3 S3 is ailake's default storage engine
WORKDIR /tmp

ARG HADOOP_AWS_JAR="hadoop-aws-3.3.1.jar"
ARG AWS_JAVA_SDK_CORE_JAR="aws-java-sdk-core-1.12.150.jar"
ARG AWS_JAVA_SDK_DYNAMODB_JAR="aws-java-sdk-dynamodb-1.12.187.jar"
ARG AWS_JAVA_SDK_S3_JAR="aws-java-sdk-s3-1.12.150.jar"

#RUN wget -q "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.1/${HADOOP_AWS_JAR}" && \
#	mv ${HADOOP_AWS_JAR} ${SPARK_HOME}/jars && \
#	wget -q "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-core/1.12.150/${AWS_JAVA_SDK_CORE}" && \
#	mv ${AWS_JAVA_SDK_CORE_JAR} ${SPARK_HOME}/jars && \
#	wget -q "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-dynamodb/1.12.187/${AWS_JAVA_SDK_DYNAMODB_JAR}" && \
#	mv ${AWS_JAVA_SDK_DYNAMODB_JAR} ${SPARK_HOME}/jars && \
#	wget -q "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-s3/1.12.150/${AWS_JAVA_SDK_S3}" && \
#	mv ${AWS_JAVA_SDK_S3_JAR} ${SPARK_HOME}/jars
COPY ${HADOOP_AWS_JAR} ${SPARK_HOME}/jars/
COPY ${AWS_JAVA_SDK_CORE_JAR} ${SPARK_HOME}/jars/
COPY ${AWS_JAVA_SDK_DYNAMODB_JAR} ${SPARK_HOME}/jars/
COPY ${AWS_JAVA_SDK_S3_JAR} ${SPARK_HOME}/jars/



# Fix Spark installation for Java 11 and Apache Arrow library
# see: https://github.com/apache/spark/pull/27356, https://spark.apache.org/docs/latest/#downloading
RUN cp -p "${SPARK_HOME}/conf/spark-defaults.conf.template" "${SPARK_HOME}/conf/spark-defaults.conf" && \
	echo 'spark.driver.extraJavaOptions -Dio.netty.tryReflectionSetAccessible=true' >> "${SPARK_HOME}/conf/spark-defaults.conf" && \
	echo 'spark.executor.extraJavaOptions -Dio.netty.tryReflectionSetAccessible=true' >> "${SPARK_HOME}/conf/spark-defaults.conf" && \
	cp -p  "${SPARK_HOME}/conf/spark-env.sh.template" "${SPARK_HOME}/conf/spark-env.sh" 

# echo "SPARK_CLASSPATH=${SPARK_CLASSPATH}:${SPARK_HOME}/jars/*:${SPARK_HOME}/extjars/*" >> "${SPARK_HOME}/conf/spark-env.sh"


# Download and install Micromamba, and initialize Conda prefix.
#   <https://github.com/mamba-org/mamba#micromamba>
#   Similar projects using Micromamba:
#     - Micromamba-Docker: <https://github.com/mamba-org/micromamba-docker>
#     - repo2docker: <https://github.com/jupyterhub/repo2docker>
# Install Python, Mamba, Jupyter Notebook, Lab, and Hub
# Generate a notebook server config
# Cleanup temporary files and remove Micromamba
# Correct permissions
# Do all this in a single RUN command to avoid duplicating all of the
# files across image layers when the permissions change

USER ${NB_UID}
WORKDIR "${HOME}"

ENTRYPOINT ["/opt/entrypoint.sh"]
