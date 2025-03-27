verifier_path="lmsys/vicuna-7b-v1.3"
drafter_path="double7/vicuna-68m"

TEMP=0.0
GPU_DEVICES=0

bench_NAME="spec_bench"
torch_dtype="float16"

CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m evaluation.inference_sps --model-path $verifier_path --drafter-path $drafter_path --model-id ${verifier_path}-${drafter_path}-${torch_dtype}-temp-${TEMP} --bench-name $bench_NAME --temperature $TEMP --dtype $torch_dtype
