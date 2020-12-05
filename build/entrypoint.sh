#!/bin/bash
set -e

ADVANCED_FILE=/nethermind/configs/mainnet_advanced.cfg

if [ "${MODE}" == "archive" ];then
    EXTRA_OPTS="--config mainnet_archive"
elif [ "${MODE}" == "advanced" ];then
    EXTRA_OPTS="--config mainnet_advanced"
    #Edit selected options
    sed -i "s/.*\"FastSync\".*/    \"FastSync\" : ${FAST_SYNC},/g" ${ADVANCED_FILE}
    sed -i "s/.*\"FastBlocks\".*/    \"FastBlocks\" : ${FAST_BLOCKS},/g" ${ADVANCED_FILE}
    sed -i "s/.*\"DownloadBodiesInFastSync\".*/    \"DownloadBodiesInFastSync\" : ${DOWNLOAD_BODIES_IN_FAST_SYNC},/g" ${ADVANCED_FILE}
    sed -i "s/.*\"UseGethLimitsInFastBlocks\".*/    \"UseGethLimitsInFastBlocks\" : ${USE_GETH_LIMITS_IN_FAST_BLOCKS},/g" ${ADVANCED_FILE}
    sed -i "s/.*\"DownloadReceiptsInFastSync\".*/    \"DownloadReceiptsInFastSync\" : ${DOWNLOAD_RECEIPTS_IN_FAST_SYNC},/g" ${ADVANCED_FILE}
    if [ ! -z "$PIVOT_HASH" ];then
        sed -i "s/.*\"PivotHash\".*/    \"PivotHash\" : "${PIVOT_HASH}",/g" ${ADVANCED_FILE}
    fi
    if [ ! -z "$PIVOT_NUMBER" ];then
        sed -i "s/.*\"PivotNumber\".*/    \"PivotNumber\" : ${PIVOT_NUMBER},/g" ${ADVANCED_FILE}
    fi
    if [ ! -z "$PIVOT_TOTAL_DIFFICULTY" ];then
        sed -i "s/.*\"PivotTotalDifficulty\".*/    \"PivotTotalDifficulty\" : "${PIVOT_TOTAL_DIFFICULTY}",/g" ${ADVANCED_FILE}
    fi
elif [ "${MODE}" == "custom" ];then
    EXTRA_OPTS="--config /data/custom.cfg"
fi

chown nethermind:nethermind -R /data
chown nethermind:nethermind -R /nethermind

exec gosu nethermind:nethermind /nethermind/Nethermind.Runner --Init.BaseDbPath=/data --Init.LogDirectory=/data/logs ${EXTRA_OPTS} "$@"
