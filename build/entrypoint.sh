#!/bin/sh
set -e

ADVANCED_FILE=/nethermind/configs/mainnet_advanced.cfg

if [ ${NETHERMIND_MODE} == "archive" ];then
    EXTRA_OPTS="--config mainnet_archive"
elif [ ${NETHERMIND_MODE} == "advanced" ];then
    EXTRA_OPTS="--config mainnet_advanced"
    #Edit selected options
    sed -i "s/.*FastSync.*/    \"FastSync\" : ${NETHERMIND_FAST_SYNC},/g" ${ADVANCED_FILE}
    sed -i "s/.*FastBlocks.*/    \"FastBlocks\" : ${NETHERMIND_FAST_BLOCKS},/g" ${ADVANCED_FILE}
    sed -i "s/.*DownloadBodiesInFastSync.*/    \"DownloadBodiesInFastSync\" : ${NETHERMIND_DOWNLOAD_BODIES_IN_FAST_SYNC},/g" ${ADVANCED_FILE}
    sed -i "s/.*UseGethLimitsInFastBlocks.*/    \"UseGethLimitsInFastBlocks\" : ${NETHERMIND_USE_GETH_LIMITS_IN_FAST_BLOCKS},/g" ${ADVANCED_FILE}
    sed -i "s/.*DownloadReceiptsInFastSync.*/    \"DownloadReceiptsInFastSync\" : ${NETHERMIND_DOWNLOAD_RECEIPTS_IN_FAST_SYNC},/g" ${ADVANCED_FILE}
    if [ ! -z "$NETHERMIND_PIVOT_HASH" ];then
        sed -i "s/.*PivotHash.*/    \"PivotHash\" : "${NETHERMIND_PIVOT_HASH}",/g" ${ADVANCED_FILE}
    fi
    if [ ! -z "$NETHERMIND_PIVOT_NUMBER" ];then
        sed -i "s/.*PivotNumber.*/    \"PivotNumber\" : ${NETHERMIND_PIVOT_NUMBER},/g" ${ADVANCED_FILE}
    fi
    if [ ! -z "$NETHERMIND_PIVOT_TOTAL_DIFFICULTY" ];then
        sed -i "s/.*PivotTotalDifficulty.*/    \"PivotTotalDifficulty\" : "${NETHERMIND_PIVOT_TOTAL_DIFFICULTY}",/g" ${ADVANCED_FILE}
    fi
elif [ ${NETHERMIND_MODE} == "custom" ];then
    EXTRA_OPTS="--config mainnet_custom"
fi

chown nethermind:nethermind -R /data
chown nethermind:nethermind -R /nethermind

exec gosu nethermind:nethermind /nethermind/Nethermind.Runner --Init.BaseDbPath=/data --Init.LogDirectory=/data/logs ${EXTRA_OPTS} "$@"
