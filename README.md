## How to get started basic Arista Container Lab

The following builds a simple lab to learn network automation. 


## requirements 
* runs on x86 (I used this on ubuntu 2cpus and 4gigs or ram)
* docker installed
* git 


## install docker and containerdev lab
This is a simple process all you need to do is 

```
git clone https://github.com/maniak-academy/ntw-contrainerlab.git
cd ntw-containerlab
```

Install docker on ubuntu 22.04 

```
chmod +x install.sh
sudo ./install/sh
```

## Build the lab
The following repo comes with 2 labs
* basic
* adv 

## Deploy the Basic Lab
If you want to deploy the basic arista environmnet cd into arista-lab


### Deploy
```
sudo containerlab deploy --debug --topo basic-env.yaml
```

### Reconfigure/Redeploy
```
sudo containerlab deploy --debug --topo basic-env.yaml --reconfigure
```


### Destroy
```
sudo containerlab destroy --debug --topo basic-env.yaml 
```


### Graph
```
sudo containerlab graph -t basic-env.yaml 
```
