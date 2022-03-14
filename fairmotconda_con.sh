#!/bin/bash
#SBATCH -n 10
#SBATCH --gres=gpu:v100:1
#SBATCH --time=48:00:00

module load gcc
module load cuda/11.0.2-po3ixtc
cd src
/home/sc1/miniconda3/envs/fairmot/bin/python train.py mot --not_gender --not_age --hmignore --gender_weight 0 --age_weight 0 --exp_id crowdhuman_jda_0308_hmignore --gpus 0 --batch_size 12 --load_model '../models/ctdet_coco_dla_2x.pth' --num_epochs 60 --lr_step '50' --lr '1e-4' --data_cfg '../src/lib/cfg/crowdhuman.json'
cd ..

            # "args": ["mot","--not_gender","--not_age",
            #     "--exp_id","crowdhuman_dla34_jda","--gpus","0","--batch_size","12",
            #     "--load_model","../models/ctdet_coco_dla_2x.pth","--num_epochs","60",
            #     "--lr_step", "50", "--data_cfg", "../src/lib/cfg/crowdhuman.json",//"--mse_loss",
            #     "--gender_weight", "0",
            #     "--age_weight", "0",                
            #     // "--multi_loss","fix"
            # "args": ["mot","--not_gender","--not_age","--hmignore",
            #     "--exp_id","crowdhuman_dla34_jda","--gpus","0","--batch_size","12",
            #     "--load_model","../models/ctdet_coco_dla_2x.pth","--num_epochs","60",
            #     "--lr_step", "50", "--data_cfg", "../src/lib/cfg/crowdhuman.json",//"--mse_loss",
            #     "--gender_weight", "0",
            #     "--age_weight", "0"
            #     // "--multi_loss","fix"