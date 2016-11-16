#!/bin/bash
if [ ! -f /config/.shards_added ]; then
    mongoshell=$(/run/cmd/mongoshell.sh)

    if [ "$SHARDS" != "" ]; then
        for shard in $SHARDS; do
            echo $mongoshell --quiet --eval "sh.addShard('$shard')"
            $mongoshell --quiet --eval "sh.addShard('$shard')"
        done
    fi

    if [ "$DB_NAME" != "" ]; then
        echo $mongoshell --quiet --eval "sh.enableSharding('$DB_NAME')"
        $mongoshell --quiet --eval "sh.enableSharding('$DB_NAME')"
    fi

    touch /config/.shards_added
fi