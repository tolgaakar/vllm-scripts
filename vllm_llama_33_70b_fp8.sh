docker run -d --gpus all \
	--name llama3_3_70b_fp8 \
	-v ~/.cache/huggingface:/root/.cache/huggingface \
	-v ~/.cache/vllm:/root/.cache/vllm \
	-v /home/ubuntu/chat_templates:/vllm-workspace/chat_templates \
 	--env "HUGGING_FACE_HUB_TOKEN=YOUR_HF_TOKEN" \
	--env "VLLM_USE_V1=1" \
	-p 8000:8000 \
	--ipc=host \
	vllm/vllm-openai:latest \
	--model cortecs/Llama-3.3-70B-Instruct-FP8-Dynamic \
	--max-model-len 45000 \
	--served-model-name Llama-3.3-70B-Instruct-FP8-Dynamic \
	--enable-chunked-prefill \
	--api-key YOUR_ARBITRARY_VLLM_TOKEN \
    --enable-auto-tool-choice \
    --tool-call-parser llama3_json \
	--chat-template chat_templates/tool_chat_template_llama3.3_json.jinja \
	--gpu_memory_utilization 0.95 \
	--tensor-parallel-size 2 # To run on a Ray cluster with 2 GPUs
	# You can also use tensor parallel with pipeline parallel
	# The common practice is to set the tensor parallel size to the number of GPUs in each node, 
	# and the pipeline parallel size to the number of nodes
	# --tensor-parallel-size 1
	# --pipeline-parallel-size 2