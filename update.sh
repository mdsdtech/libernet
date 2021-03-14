#!/bin/bash

function update_libernet() {
  echo -e "Updating Libernet ..." \
  && git fetch origin master \
  && git reset --hard FETCH_HEAD \
  && bash ./install.sh \
  && echo -e "\nLibernet successfully updated!"
}

function update_libernet_web() {
  libernet_tmp="/tmp/libernet"
  "${LIBERNET_DIR}/bin/log.sh" -u 1 \
    && cd /tmp \
    && rm -rf "${libernet_tmp}" \
    && git clone git://github.com/lutfailham96/libernet.git \
    && cd "${libernet_tmp}" \
    && bash install.sh \
    && cd /tmp \
    && rm -rf "${libernet_tmp}" \
    && "${LIBERNET_DIR}/bin/log.sh" -u 2
}

case $1 in
  -web)
    update_libernet_web || "${LIBERNET_DIR}/bin/log.sh" -u 3
    ;;
  *)
    update_libernet
    ;;
esac