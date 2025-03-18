docker run -d --gpus all \
	--name qwen_72b_int4 \
	-v ~/.cache/huggingface:/root/.cache/huggingface \
	-v ~/.cache/vllm:/root/.cache/vllm \
 	--env "HUGGING_FACE_HUB_TOKEN=YOUR_HF_TOKEN" \
	--env "VLLM_USE_V1=1" \
	-p 8000:8000 \
	--ipc=host \
	vllm/vllm-openai:latest \
	--model Qwen/Qwen2.5-72B-Instruct-GPTQ-Int4 \
	--max-model-len 32768 \
	--served-model-name Qwen25_72B_INT4 \
	--enable-chunked-prefill \
	--api-key YOUR_ARBITRARY_VLLM_TOKEN \
    --enable-auto-tool-choice \
    --tool-call-parser hermes \
	--gpu_memory_utilization 0.95 \