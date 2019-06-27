#!/bin/bash

if hash composer 2>/dev/null; then
    PUBLIC_KEY="$(composer config -gl | grep '\[http-basic.repo.magento.com.username\]' | cut -c40-)"
    PRIVATE_KEY="$(composer config -gl | grep '\[http-basic.repo.magento.com.password\]' | cut -c40-)"
fi

if [ -z "$PUBLIC_KEY" ] || [ -z "$PRIVATE_KEY" ]; then
    exec < /dev/tty
    echo
    echo
    echo "    Authentication required (repo.magento.com, public_key and private_key):"
    read -p "        Username: " PUBLIC_KEY
    read -p "        Password: " PRIVATE_KEY
    echo
    if [ -n "$PUBLIC_KEY" ] && [ -n "$PRIVATE_KEY" ] && hash composer 2>/dev/null; then
        read -p "    Add authentication information to host composer config? y/n: " ADD_AUTH
        echo
        if [[ $ADD_AUTH =~ ^[Yy]$ ]]; then
            composer global config http-basic.repo.magento.com $PUBLIC_KEY $PRIVATE_KEY
        fi
        ADD_AUTH=''
    fi
    exec <&-
fi