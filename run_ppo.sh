CUDA_VISIBLE_DEVICES=0,1 torchrun --nproc_per_node 2 ppo_training.py \
    --model_type auto \
    --model_name_or_path Qwen/Qwen1.5-0.5B-Chat \
    --reward_model_name_or_path OpenAssistant/reward-model-deberta-v3-large-v2 \
    --torch_dtype float16 \
    --device_map auto \
    --train_file_dir ./data/finetune \
    --validation_file_dir ./data/finetune \
    --batch_size 8 \
    --max_source_length 2056 \
    --max_target_length 256 \
    --max_train_samples 1000 \
    --use_peft True \
    --lora_rank 8 \
    --lora_alpha 16 \
    --lora_dropout 0.05 \
    --do_train \
    --max_steps 100 \
    --learning_rate 1e-5 \
    --save_steps 50 \
    --output_dir outputs-rl-qwen-v1 \
    --early_stopping True \
    --target_kl 0.1 \
    --reward_baseline 0.0
