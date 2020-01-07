# Test [![Build Status](https://travis-ci.com/leafOfTree/test.svg?branch=master)](https://travis-ci.com/leafOfTree/test)

Test filetype plugins, like

- [vim-vue-plugin](https://github.com/leafOfTree/vim-vue-plugin)

- [vim-svelte-plugin](https://github.com/leafOfTree/vim-svelte-plugin)

## Usage

    bash start.sh <filetype> <plugin>

With fold structrue like

    - test/
    |
    - vim-vue-plugin/

providing `test/example.vue` which has correct indentation,

run 

    bash test/start.sh vue vim-vue-plugin

to check if there are indentation changes or error messages.

### Configure

The `.travis.yml` under `vim-vue-plugin` is

```yaml
install:
    - git clone --depth=1 https://github.com/leafOfTree/test ../test

script:
    - bash ../test/start.sh vue vim-vue-plugin
```
