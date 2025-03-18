docker run -d --gpus all \
	--name multilingual-e5-large-instruct \
	-v ~/.cache/huggingface:/root/.cache/huggingface \
	-v ~/.cache/vllm:/root/.cache/vllm \
 	--env "HUGGING_FACE_HUB_TOKEN=YOUR_HF_TOKEN" \
	-p 8001:8000 \
	--ipc=host \
	vllm/vllm-openai:latest \
	--task embed \
	--model intfloat/multilingual-e5-large-instruct \
	--served-model-name multilingual-e5-large-instruct \
	--gpu_memory_utilization 0.05 \
	--api-key YOUR_ARBITRARY_VLLM_TOKEN \
	# --env "VLLM_USE_V1=1" \ V1 creates pronblems
	# --max-model-len 512 \