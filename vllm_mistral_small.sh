docker run -d --gpus all \
	--name mistral_small \
	-v ~/.cache/huggingface:/root/.cache/huggingface \
	-v ~/.cache/vllm:/root/.cache/vllm \
	-v /home/ubuntu/vllm-chat-templates:/vllm-workspace/chat_templates \
 	--env "HUGGING_FACE_HUB_TOKEN=YOUR_HF_TOKEN" \
	--env "VLLM_USE_V1=1" \
	-p 8000:8000 \
	--ipc=host \
	vllm/vllm-openai:latest \
	--model mistralai/Mistral-Small-24B-Instruct-2501 \
	--tokenizer-mode mistral \
	--config-format mistral \
	--load-format mistral \
	--trust-remote-code \
	--max-model-len 32768 \
	--served-model-name Mistral-Small-Instruct \
	--dtype bfloat16 \
	--enable-chunked-prefill \
	--gpu_memory_utilization 0.85 \
	--api-key YOUR_ARBITRARY_VLLM_TOKEN \
    --enable-auto-tool-choice \
    --tool-call-parser mistral \
	--chat-template examples/tool_chat_template_mistral_parallel.jinja \