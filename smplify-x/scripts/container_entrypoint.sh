#!/usr/bin/bash

python3 repos/smplify-x/smplifyx/main.py --config repos/smplify-x/cfg_files/fit_smplx.yaml --data_folder data \
  --output_folder outputs --model_folder repos/smplify-x/models --vposer_ckpt repos/smplify-x/models/vposer_v1_0 \
  --part_segm_fn repos/smplify-x/models/smplx_parts_segm.pkl --visualize True --interactive True