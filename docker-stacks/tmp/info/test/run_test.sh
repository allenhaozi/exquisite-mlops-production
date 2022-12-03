

set -ex



test -f $PREFIX/bin/micromamba
micromamba --help
export TMPDIR="${TMPDIR:-/tmp}"
if [ ! -d "${TMPDIR}" ]; then mkdir -p "${TMPDIR}"; fi
stat $TMPDIR
export MAMBA_ROOT_PREFIX=$TMPDIR/mamba
micromamba create -p $TMPDIR/testenv --override-channels -c conda-forge --yes python=3.9
$TMPDIR/testenv/bin/python --version
$TMPDIR/testenv/bin/python -c 'import ssl'
exit 0
