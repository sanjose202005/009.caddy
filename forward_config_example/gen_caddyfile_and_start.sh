#!/usr/bin/env bash

CADDYFILE="${CADDYFILE:-./Caddyfile}"
ROOTDIR="${ROOTDIR:-/srv/index}"
SITE_ADDRESS="${SITE_ADDRESS:-localhost}"

if [ 2 = 3 ] ; then
PROXY_USERNAME="${PROXY_USERNAME:-userName01}"
PROXY_PASSWORD="${PROXY_PASSWORD:-passWord01}"
PROBE_RESISTANT="${PROBE_RESISTANT:-true}"
SECRET_LINK="${SECRET_LINK:-secret_Link}"
fi

rm -f "${CADDYFILE}"

generate_caddyfile() {
    mkdir -p "$(dirname "${CADDYFILE}")"

    echo "${SITE_ADDRESS} {" > ${CADDYFILE}
    echo "  root $ROOTDIR" >> ${CADDYFILE}

    echo "  forwardproxy {" >> ${CADDYFILE}
    if [[ ! -z ${PROXY_USERNAME} ]]; then
        echo "    basicauth ${PROXY_USERNAME} ${PROXY_PASSWORD}" >> ${CADDYFILE}
    fi
    if [[ "${PROBE_RESISTANT}" = true ]]; then
        echo "    probe_resistance ${SECRET_LINK}" >> ${CADDYFILE}
    fi
    echo "  }" >> ${CADDYFILE}

    echo "}" >> ${CADDYFILE}
}

if [ -f "${CADDYFILE}" ]; then
    echo "Using provided Caddyfile"
else
    echo "Caddyfile is not provided: generating new one"
    generate_caddyfile
fi

#caddy ${CADDY_OPTS} -conf ${CADDYFILE}

grep . ${CADDYFILE}
ls -l  ${CADDYFILE}
