docker run -d --gpus all \
	--name watt_tool_8b \
	-v ~/.cache/huggingface:/root/.cache/huggingface \
	-v ~/.cache/vllm:/root/.cache/vllm \
 	--env "HUGGING_FACE_HUB_TOKEN=YOUR_HF_TOKEN" \
	--env "VLLM_USE_V1=1" \
	-p 8001:8000 \
	--ipc=host \
	vllm/vllm-openai:latest \
	--model watt-ai/watt-tool-8B \
	--max-model-len 32768 \
	--served-model-name watt-tool-8B \
	--enable-chunked-prefill \
	--gpu_memory_utilization 0.35 \
	--dtype bfloat16 \
	--api-key YOUR_ARBITRARY_VLLM_TOKEN \
    --enable-auto-tool-choice \
    --tool-call-parser llama3_json \
	--chat-template examples/tool_chat_template_llama3.1_json.jinja