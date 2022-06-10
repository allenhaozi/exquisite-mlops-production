ARG BASE_CONTAINER=base-pyspark:v0.1.0
FROM ${BASE_CONTAINER}

ARG DELTA_LAKE_VERSION=1.2.1
ARG SCALA_VERSION=2.12
ARG SPARK_VERSION=3.2.1
ARG DELTA_PACKAGE=io.delta:delta-core_${SCALA_VERSION}:${DELTA_LAKE_VERSION}


ARG DELTA_CORE_JAR="delta-core_2.12-1.2.1.jar"
ARG ANTLR4_RUNTIME_JAR="antlr4-runtime-4.8.jar"
ARG DELTA_STORAGE_JAR="delta-storage-1.2.1.jar" 
ARG JACKSON_CORE_ASL_JAR="jackson-core-asl-1.9.13.jar"

COPY ${DELTA_CORE_JAR} ${SPARK_HOME}/jars/
COPY ${ANTLR4_RUNTIME_JAR} ${SPARK_HOME}/jars/
COPY ${DELTA_STORAGE_JAR} ${SPARK_HOME}/jars/
COPY ${JACKSON_CORE_ASL_JAR} ${SPARK_HOME}/jars/


RUN pip install --no-cache-dir delta-spark==${DELTA_LAKE_VERSION}

USER root

RUN echo "spark.sql.extensions  io.delta.sql.DeltaSparkSessionExtension" >> "${SPARK_HOME}/conf/spark-defaults.conf" && \
	echo "spark.sql.catalog.spark_catalog org.apache.spark.sql.delta.catalog.DeltaCatalog" >> "${SPARK_HOME}/conf/spark-defaults.conf"

# Install Python 3 packages
RUN arch=$(uname -m) && \
	if [ "${arch}" == "aarch64" ]; then \
	# Prevent libmamba from sporadically hanging on arm64 under QEMU
	# <https://github.com/mamba-org/mamba/issues/1611>
	export G_SLICE=always-malloc; \
	fi && \
	mamba install --quiet --yes \
	'sqlalchemy' && \
	mamba clean --all -f -y && \
	fix-permissions "${CONDA_DIR}" && \
	fix-permissions "/home/${NB_USER}"

USER ${NB_UID}
WORKDIR "${HOME}"
