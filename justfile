node_js_version := trim_start_match(`node -v`, "v")

build:
    # https://github.com/ember-cli/ember-cli/blob/master/docs/node-support.md
    if [ "{{ semver_matches(node_js_version, ">= 16, < 18") }}" = "false" ]; then \
        echo "node.js version is {{ node_js_version }}. 16.x required"; \
        exit 1; \
    fi

    make static-dist bin
    strip bin/bao
