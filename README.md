# par-plugin-facter
Packets-at-REST plugin for facter gem

## PAR API extension

* https://collector/facter.json
* https://collector/nodes/1/facter.json

## Authentication

Requires API 0 level access for collector and universal access.

Specific node access allows for individual access as well.

## Facter

* [Facter Source](https://github.com/puppetlabs/facter)

`Facter` provides information about the system such the following.

```json
"processors": {
  "models": [
    "Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz",
    "Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz",
    "Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz",
    "Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz"
  ],
  "count": 4,
  "physicalcount": 1
},
"partitions": {
  "sda1": {
    "uuid": "8f0b937f-522d-4359-b4de-31597b9a90df",
    "size": "497664",
    "mount": "/boot"
  },
  "sda2": {
    "size": "2"
  },
  "sda5": {
    "uuid": "a1165f17-cd72-4b66-acb8-01e6ae1ced31",
    "size": "499615744",
    "filesystem": "crypto_LUKS"
  }
},
"kernelrelease": "3.13.0-52-generic",
"kernelmajversion": "3.13",
"lsbdistcodename": "trusty",
"netmask": "255.255.0.0",
"selinux": false,
"uniqueid": "007f0101",
"system_uptime": {
  "seconds": 696470,
  "hours": 193,
  "days": 8,
  "uptime": "8 days"
},
```
