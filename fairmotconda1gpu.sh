#!/bin/bash
#SBATCH -n 10
#SBATCH --gres=gpu:v100:1
#SBATCH --time=48:00:00

module load gcc
module load cuda/11.0.2-po3ixtc
cd src
/home/sc1/miniconda3/envs/fairmot/bin/python train.py mot --exp_id crowdhuman_dla34 --gpus 0 --batch_size 8 --load_model '../models/ctdet_coco_dla_2x.pth' --num_epochs 60 --lr_step '50' --data_cfg '../src/lib/cfg/crowdhuman.json'
cd ..
