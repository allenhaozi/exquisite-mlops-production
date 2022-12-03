# OpenAIOS AILake PYSpark Base Image

ARG ROOT_CONTAINER=openaios/ailake/base-spark-3.2.1:v0.1.0

FROM $ROOT_CONTAINER

# Configure environment
ENV CONDA_DIR=/opt/conda \
	PATH="${CONDA_DIR}/bin:${PATH}" \
	HOME="/home/${NB_USER}"


# Create NB_USER with name jovyan user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN mkdir -p "${CONDA_DIR}" && \
	chown "${NB_USER}:${NB_GID}" "${CONDA_DIR}" && \
	fix-permissions "${HOME}" && \
	fix-permissions "${CONDA_DIR}"

USER ${NB_UID}

# Pin python version here, or set it to "default"
ARG PYTHON_VERSION=3.8

ARG hadoop_version="3.2"
ARG pyspark_version="3.2.1"

ENV PYSPARK_HADOOP_VERSION="${hadoop_version}" \
	PYSPARK_VERSION="${pyspark_version}"

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
COPY --chown="${NB_UID}:${NB_GID}" initial-condarc "${CONDA_DIR}/.condarc"

WORKDIR /tmp

USER root

COPY micromamba-0.24.0-0.tar.bz2 /tmp/micromamba.tar.bz2

RUN set -x && \
	arch=$(uname -m) && \
	if [ "${arch}" = "x86_64" ]; then \
	# Should be simpler, see <https://github.com/mamba-org/mamba/issues/1437>
	arch="64"; \
	fi && \
	tar -xvjf /tmp/micromamba.tar.bz2 --strip-components=1 bin/micromamba && \
	rm /tmp/micromamba.tar.bz2 && \
	PYTHON_SPECIFIER="python=${PYTHON_VERSION}" && \
	if [[ "${PYTHON_VERSION}" == "default" ]]; then PYTHON_SPECIFIER="python"; fi && \
	if [ "${arch}" == "aarch64" ]; then \
	# Prevent libmamba from sporadically hanging on arm64 under QEMU
	# <https://github.com/mamba-org/mamba/issues/1611>
	# We don't use `micromamba config set` since it instead modifies ~/.condarc.
	echo "extract_threads: 1" >> "${CONDA_DIR}/.condarc"; \
	fi && \
	# Install the packages
	./micromamba install \
	--root-prefix="${CONDA_DIR}" \
	--prefix="${CONDA_DIR}" \
	--yes \
	"${PYTHON_SPECIFIER}" \
	'mamba' \
	"pyspark=${PYSPARK_VERSION}" && \
	rm micromamba && \
	# Pin major.minor version of python
	mamba list python | grep '^python ' | tr -s ' ' | cut -d ' ' -f 1,2 >> "${CONDA_DIR}/conda-meta/pinned" && \
	mamba clean --all -f -y && \
	rm -rf "/home/${NB_USER}/.cache/yarn" && \
	fix-permissions "${CONDA_DIR}" && \
	fix-permissions "/home/${NB_USER}"


USER ${NB_UID}
WORKDIR "${HOME}"
