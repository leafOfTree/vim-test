# Test

Contains test files for vim plugins in specific branch:

- [vim-vue-plugin](https://github.com/leafOfTree/vim-vue-plugin)

- [vim-svelte-plugin](https://github.com/leafOfTree/vim-svelte-plugin)

## Usage

With fold structrue like

    - test/
    |
    - vim-vue-plugin/

run 

    bash test/src/test.sh

### Configure

The `.travis.yml` under `vim-vue-plugin` is

```yaml
install:
    - git clone --single-branch -b vim-vue-plugin --depth=1 https://github.com/leafOfTree/test ../test

script:
    - bash ../test/src/test.sh
```
