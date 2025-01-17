#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

export DISABLE_AUTOBREW=1

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" == "1" ]]; then
    sed -i "s?\$\(R_HOME\)/bin/Rscript?${BUILD_PREFIX}/bin/Rscript?g" src/Makevars
fi
${R} CMD INSTALL --build . ${R_ARGS:-}
