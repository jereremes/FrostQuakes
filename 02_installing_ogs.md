Just the installation itself on a fresh Linux can simply be done via `pip` (please do read until the end on what to do if `pip` is not working), but fresh installation does miss some dependencies, that should be installed before OGS:
## Basic dependencies
```
pip install notebook ogs6py ogstools h5py matplotlib numpy pandas vtk pyvista meshio[all] nbconvert nb2hugo
pip install --upgrade nbdime
pip install --upgrade gmsh
pip install https://github.com/joergbuchwald/VTUinterface/archive/refs/heads/master.zip
sudo apt-get install python3-scipy
```
## Installing Anaconda
To install Snakemake you need conda and mamba. If you are missing Anaconda from your installation, download it from https://www.anaconda.com/download/ and execute the `sh`file by using the command bash Anaconda-<YOUR-VERSION>.sh` and follow the instructions. Remember to reopen the terminal after the installation and execute `source ~/.bashrc` and make sure that conda is working by executing `conda list`

Installing Mamba might take forever, but there is a faster way: installing libmamba.
```
conda update conda
conda update conda-build
conda install -n base conda-libmamba-solver
```

### Installing Mamba and Snakemake:
```
conda config --set solver libmamba
conda install -n base -c conda-forge mamba
conda activate base
mamba create -c conda-forge -c bioconda -n snakemake snakemake
```
## Installing OGS:
```
pip install ogs
```

### Note on pip
Since doing this myself, the most up-to-date python installations might have gotten more complicated since contemporary python requires a level of containerization. Thus, global installations are frowned upon, which is absolute garbage for people doing scientific computing instead of application or software coding. Stack Exchange is of no help here, since they are stuck in their ways and will not help you fix the problem but just disparage the use of global installations (even if you are already running a virtual machine they want you to waste your computation efforts even further on yet another virtual environment upon virtual environment).

Anyway, rant aside, if the above pip installations do not work and `pip inject` does not work either, you might want to use the following syntax
```
pip3 install <PACKAGE-NAME> --break-system-packages
```
