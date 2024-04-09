## Usage example

```bash
git clone https://github.com/taylormonacelli/jitteryjune
boilerplate --template-url=jitteryjune/templates --output-folder=. --non-interactive
cp vars.json.sample vars.json
jq '.SpotPrice = null' vars.json | sponge vars.json # create on-demand instance
# or
jq '.SpotPrice = "auto"' vars.json | sponge vars.json # create spot instance
# or
jq '.SpotPrice = 0.34' vars.json | sponge vars.json # create spot instance with specific price
vim vars.json #adjust
make pretty
packer build -var-file=vars.json .
```

## Usage example

```bash
boilerplate --template-url=https://github.com/taylormonacelli/jitteryjune/archive/refs/heads/master.zip//jitteryjune-master/templates --output-folder=. --non-interactive
cp vars.json.sample vars.json
jq '.SpotPrice = null' vars.json | sponge vars.json # create on-demand instance
# or
jq '.SpotPrice = "auto"' vars.json | sponge vars.json # create spot instance
# or
jq '.SpotPrice = 0.34' vars.json | sponge vars.json # create spot instance with specific price
vim vars.json #adjust
make pretty
packer build -var-file=vars.json .
```
