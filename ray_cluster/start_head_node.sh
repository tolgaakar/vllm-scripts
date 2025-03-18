bash run_cluster.sh \
                vllm/vllm-openai \
                0.0.0.0 \
                --head \
                ~/.cache/huggingface \
                -e VLLM_HOST_IP=0.0.0.0