#/bin/sh

set -e

tags=""
tags="$tags 3.0.2-php7.4"
tags="$tags 3.1.2-php8.0"
tags="$tags 3.2.3-php8.0"
tags="$tags 4.0.0-php8.0"
tags="$tags 4.0.0-php8.1"
tags="$tags 4.0.0-php8.2"

for tag in $tags; do
    docker build -t biblibre/omeka-s-ci:$tag $tag
done
