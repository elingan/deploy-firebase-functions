#!/bin/bash

cd functions; npm install

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

if [ -z "${FIREBASE_CONFIG_FILE}" ]; then
    echo "FIREBASE_CONFIG_FILE is missing"
    exit 1
fi

firebase functions:config:set env="$(cat ${FIREBASE_CONFIG_FILE})"

firebase deploy \
    -m "${GITHUB_REF} (${GITHUB_SHA})" \
    --project ${FIREBASE_PROJECT} \
    --only functions
-
