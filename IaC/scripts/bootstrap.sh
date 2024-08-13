# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# Script to build the Python environment

# Downloading Miniconda
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p $HOME/conda

# Setting miniconda in the PATH
echo -e '\nexport PATH=$HOME/conda/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc

# Installing python packages using conda
conda install -y boto3 pendulum numpy scikit-learn 

# Installing packages via pip 
pip install --upgrade pip
pip install findspark
pip install pendulum
pip install boto3
pip install numpy
pip install python-dotenv
pip install scikit-learn

# Creating folders
mkdir $HOME/pipeline
mkdir $HOME/logs

