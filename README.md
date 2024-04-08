## Usage example

```bash
boilerplate --template-url=templates --output-folder=. --non-interactive
cp vars.json.sample vars.json
vim vars.json #adjust
make pretty
packer build . -var-file=vars.json
```

```bash
boilerplate --template-url=https://github.com/taylormonacelli/jitteryjune/archive/refs/heads/master.zip//jitteryjune-master/templates --output-folder=. --non-interactive
cp vars.json.sample vars.json
vim vars.json #adjust
make pretty
packer build . -var-file=vars.json
```
