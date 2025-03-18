docker run -d --gpus all \
	--name deepseek_r1_32b \
	-v ~/.cache/huggingface:/root/.cache/huggingface \
 	--env "HUGGING_FACE_HUB_TOKEN=YOUR_HF_TOKEN" \
	-p 8000:8000 \
	--ipc=host \
	vllm/vllm-openai:latest \
	--model dwetzel/DeepSeek-R1-Distill-Qwen-32B-FP8-Dynamic \
	--max-model-len 28000 \
	--served-model-name DeepSeek_32B_R1_Distill_FP8 \
	--enable-chunked-prefill \
	--api-key YOUR_ARBITRARY_VLLM_TOKEN \
	--enable-auto-tool-choice \
    --tool-call-parser hermes \
	--gpu_memory_utilization 0.93 \