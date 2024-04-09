## Usage examples


```bash
boilerplate --template-url=https://github.com/taylormonacelli/jitteryjune/archive/refs/heads/master.zip//jitteryjune-master/templates --output-folder=. --non-interactive
```


or


```bash
git clone https://github.com/taylormonacelli/jitteryjune
boilerplate --template-url=jitteryjune/templates --output-folder=. --non-interactive
```

and then

```bash
cp vars.json.sample vars.json
```

and then

```bash
# create on-demand instance
yq -i -ojson '.SpotPrice = null' vars.json

# or create spot instance
yq -i -ojson '.SpotPrice = "auto"' vars.json

# or create spot instance with specific price
yq -i -ojson '.SpotPrice = 0.34' vars.json
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







So, for example I've been using this:
```bash
boilerplate --template-url=https://github.com/taylormonacelli/jitteryjune/archive/refs/heads/master.zip//jitteryjune-master/templates --output-folder=. --non-interactive
! test -f vars.json && cp vars.json.sample vars.json
yq --inplace -ojson '.SpotPrice = "auto" | .SubnetId = "subnet-1111" | .VpcId = "vpc-2222"' vars.json
make pretty
packer build -var-file=vars.json .
```
