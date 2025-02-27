''' ------------------------------- BASIC CONDA -----------------------------  '''
envinstall miniconda3

# general information
conda info

# see environments
conda info --envs

# create environment
conda install python=3.7.6
conda create -n <env name> python=3.7.6

# delete environment
conda env remove -n <env name>

# activate/deactivate environment
conda activate pyenv2
conda deactivate

# steps for SG
envinstall miniconda3
conda install python=3.7.6
conda create -n pyenv python=3.7.6
conda activate pyenv