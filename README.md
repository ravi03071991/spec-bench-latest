# Evaluation Script for SPS Benchmark

This README explains how to run the evaluation for the SPS (Speculative Sampling) benchmark using a verifier and drafter model setup.

## Overview

This script runs evaluation using a verifier and a drafter model across a specified benchmark using the `inference_sps` module.

## Requirements

- Python environment with required dependencies installed

```python
pip install -r requirements.txt
```

- Access to the Hugging Face models (example):
  - Verifier: `lmsys/vicuna-7b-v1.3`
  - Drafter: `double7/vicuna-68m`

## Parameters

You need to set following parameters before running the `eval.sh` script based on your experiment setup:

| Variable         | Description                          | Example                  |
|------------------|--------------------------------------|--------------------------|
| `verifier_path`  | Hugging Face path to verifier model  | `lmsys/vicuna-7b-v1.3`   |
| `drafter_path`   | Hugging Face path to drafter model   | `double7/vicuna-68m`     |
| `TEMP`           | Sampling temperature                 | `0.0`                    |
| `GPU_DEVICES`    | GPU device ID to use                 | `0`                      |
| `bench_NAME`     | Name of the benchmark to run         | `spec_bench`             |
| `torch_dtype`    | Precision dtype for model inference  | `float16`                |

## Example

Run the script:

```bash
bash eval.sh
```

## Run via Command

Alternatively, you can run via CLI:

```bash
verifier_path= "lmsys/vicuna-7b-v1.3"
drafter_path= "double7/vicuna-68m"

TEMP=0.0
GPU_DEVICES=0

bench_NAME="spec_bench"
torch_dtype="float16"

CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m evaluation.inference_sps \
  --model-path $verifier_path \
  --drafter-path $drafter_path \
  --model-id ${verifier_path}-${drafter_path}-${torch_dtype}-temp-${TEMP} \
  --bench-name $bench_NAME \
  --temperature $TEMP \
  --dtype $torch_dtype
```
