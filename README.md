# Sysprofile-Dockerized

Dockerized version of the Sysprofiler forensic tool by (khyrenz.com)[https://github.com/khyrenz/sysprofiler]


## Build

```
docker build 
```

## Usage

```
docker pull lcmko/sysprofiler:1.0
docker run -ti -v "/YOURPATH_TO_RAW_DISK_IMAGE_FOLDER/:/tmp/images" sysprofiler:1.0 "./sysprofiler.sh" -h

---
Usage: sysprofiler.sh -i <image file to process> [-f <output format>] [-k]
Optional arguments:
   -f <output format>    - supported formats: tsv,txt (default is tsv). Only one format at a time is supported.
   -h                    - display this help information
   -k                    - keep files extracted from image file (deleted by default when script completes)
   -m <modules>          - supported modules: osinfo,users,apps,filelist,usbs,networks
                         - (default is all modules).
                           To run multiple modules, separate with commas, eg '-m osinfo,users,usbs'
                           Note: file listing will only be run on the Windows volume
   -n                    - Compare file hashes to NIST NSRL database. Please note, this will take some time!
                           Can be used with modules: apps,filelist
                           Note: If the NIST NSRL database (NSRLFile.txt) does not already exist in /data,
                           it will be downloaded (assuming an Internet connection can be found)
   -p                    - dump out password hashes for users.
   -s                    - include hashes (MD5 and SHA1). Please note, this will take some time!
                           can be used with modules: osinfo,apps,filelist
---


docker run -ti -v "/YOURPATH_TO_RAW_DISK_IMAGE_FOLDER/:/tmp/images" sysprofiler:1.0 "./sysprofiler.sh" -i /tmp/images/YOURDISK.raw

```



