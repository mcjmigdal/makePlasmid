## SETUP
```
git clone https://github.com/mcjmigdal/makePlasmid.git
docker pull mcjmigdal/makeplasmid
```

## USAGE
```
makePlasmid.sh -1 first.read.fastq.gz -2 second.read.fastq.gz -o out.dir.name [-a AGATCGGAAGAG] [-A AGATCGGAAGAG]
!!!use relative paths to input files!!!
```

##  MAINTAINANCE
```
cd src
docker build -t makeplasmid .
```
