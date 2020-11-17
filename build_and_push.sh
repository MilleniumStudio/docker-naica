#!/bin/bash

unity_version=2019.2.3f1
unity_changeset=8e55c27a4621
unity_modules=( android ios )


cd editor

for module in "${unity_modules[@]}"
do
    docker build \
        --tag milleniumstudio/unityeditor:ubuntu-${unity_version}-${module}-latest \
        --tag milleniumstudio/unityeditor:${unity_version}-${module}-latest \
        --build-arg version=${unity_version} \
        --build-arg changeSet=${unity_changeset} \
        --build-arg module=${module} \
        .

    docker push milleniumstudio/unityeditor:ubuntu-${unity_version}-${module}-latest
    docker push milleniumstudio/unityeditor:${unity_version}-${module}-latest
done
