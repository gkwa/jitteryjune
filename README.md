## Usage examples

```bash
git clone https://github.com/taylormonacelli/jitteryjune
boilerplate --template-url=jitteryjune/templates --output-folder=. --non-interactive
```

or

```bash
boilerplate --template-url=https://github.com/taylormonacelli/jitteryjune/archive/refs/heads/master.zip//jitteryjune-master/templates --output-folder=. --non-interactive
```

and then

```bash
cp vars.json.sample vars.json
```

and then

```bash
# create on-demand instance
cat <<< $(jq '.SpotPrice = null' vars.json) > vars.json

# or create spot instance
cat <<< $(jq '.SpotPrice = "auto"' vars.json) > vars.json

# or create spot instance with specific price
cat <<< $(jq '.SpotPrice = 0.34' vars.json) > vars.json
```

and then adjust vpc and subnet and...:
```bash
vim vars.json
```





and then

```bash
make pretty
packer build -var-file=vars.json .
```
