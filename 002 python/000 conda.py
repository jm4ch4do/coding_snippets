''' ------------------------------- BASIC CONDA -----------------------------  '''
# general information
conda info

# see environments
conda info --envs

# create environment
conda create -n <env name> python=3.7.6

# delete environment
conda env remove -n <env name>

# activate/deactivate environment
conda activate pyenv2
conda deactivate