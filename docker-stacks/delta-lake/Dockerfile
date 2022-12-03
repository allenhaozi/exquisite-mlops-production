ARG BASE_CONTAINER=openaios/ailake/base-pyspark-3.2.1-py-v3.8:v0.2.0
FROM ${BASE_CONTAINER}

ARG DELTA_LAKE_VERSION=1.2.1
ARG SCALA_VERSION=2.12
ARG SPARK_VERSION=3.2.1
ARG DELTA_PACKAGE=io.delta:delta-core_${SCALA_VERSION}:${DELTA_LAKE_VERSION}


# issues https://github.com/delta-io/delta/issues/1121
USER root

COPY extra-jars /tmp/extra-jars
RUN cp /tmp/extra-jars/*.jar ${SPARK_HOME}/jars/ && rm -rf /tmp/extra-jars


RUN pip install --no-cache-dir delta-spark==${DELTA_LAKE_VERSION}

#fix-permissions

RUN echo "spark.sql.extensions  io.delta.sql.DeltaSparkSessionExtension" >> "${SPARK_HOME}/conf/spark-defaults.conf" && \
	echo "spark.sql.catalog.spark_catalog org.apache.spark.sql.delta.catalog.DeltaCatalog" >> "${SPARK_HOME}/conf/spark-defaults.conf"

# Install Python 3 packages
RUN arch=$(uname -m) && \
	if [ "${arch}" == "aarch64" ]; then \
	# Prevent libmamba from sporadically hanging on arm64 under QEMU
	# <https://github.com/mamba-org/mamba/issues/1611>
	export G_SLICE=always-malloc; \
	fi && \
	mamba install --yes \
	'sqlalchemy' && \
	mamba clean --all -f -y && \
	fix-permissions "${CONDA_DIR}" && \
	fix-permissions "/home/${NB_USER}"

USER ${NB_UID}
WORKDIR "${HOME}"
