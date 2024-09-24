#!/bin/bash
#SBATCH --job-name=fwe4000
#SBATCH --account=project_462000353
#SBATCH --output=fwe4000.o%j
#SBATCH --error=fwe4000.e%j
#SBATCH --partition=standard-g
#SBATCH --nodes=1
#SBATCH --gres=gpu:mi250:4
#SBATCH --time=1-0:00:00

module use /appl/local/csc/modulefiles/
module purge
module load LUMI
module load pytorch
export PROJECTID="project_462000353"
export PROJECTPATH="/projappl/$PROJECTID/$USER/Lighteval-on-LUMI"
source $PROJECTPATH/.venv/bin/activate
export SCRATCHPATH="/scratch/$PROJECTID/$USER"
export HF_HOME="/scratch/$PROJECTID/$USER/hf_cache/"
export PYTHONPATH="$PROJECTPATH/.venv/lib/python3.10/site-packages/"
export MASTER_PORT=29554


srun singularity_wrapper exec accelerate launch \
 --multi_gpu --num_processes=2 $PROJECTPATH/run_evals_accelerate.py \
 --model_args="pretrained=$SCRATCHPATH/checkpoints/fineweb-edu/step_4000,model_parallel=True,trust_remote_code=True" \
 --custom_tasks="$PROJECTPATH/community_tasks/lighteval_tasks.py" --output_dir="$PROJECTPATH/evals/fineweb/step4000" --max_samples 1000 \
 --tasks "$PROJECTPATH/examples/tasks/fineweb.txt" \
 --override_batch_size=1
