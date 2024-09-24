# Fineweb Experiments

This repository contains experiments conducted by the [TurkuNLP group](https://turkunlp.org/) on Hugging Face's Fineweb data. The primary purpose of this project is to replicate Hugging Face's Fineweb-edu results and develop experimental models based on the dataset.

## About Fineweb

[Fineweb](https://huggingface.co/datasets/HuggingFaceFW/fineweb) is a dataset developed by Hugging Face that includes web data used for educational purposes and model training. Fineweb-edu is a specific subset of the Fineweb dataset used for model evaluation and fine-tuning experiments. The dataset supports various machine learning tasks such as natural language understanding and generation.

## Project Structure

- **`TurkuNLP/`**: This folder contains evaluation results of models recreated by us using the Fineweb-edu data. These evaluations are part of our efforts to replicate and expand upon the results provided by Hugging Face.
  
- **`HF_FW/`**: This folder holds evaluation results of the original Hugging Face Fineweb-edu models (e.g., `ablation-model-fineweb-edu`). These models were evaluated by us, as the official results were not made publicly available.
  
- **`examples/`**: In this folder, you will find example Slurm scripts for running experiments on the LUMI supercomputer.

## Evaluation Process

All evaluations in this project are conducted using the [Lighteval](https://github.com/JousiaPiha/Lighteval-on-LUMI) suite, which we have adapted for use on the LUMI supercomputer. The evaluation procedure follows the instructions outlined in the official Fineweb repository: [lighteval_tasks.py#L12](https://huggingface.co/datasets/HuggingFaceFW/fineweb/blob/main/lighteval_tasks.py#L12).

## Running on LUMI

The Lighteval suite has been specifically adapted for execution on the LUMI supercomputer. Example Slurm scripts are provided in the `examples/` folder to help set up and run experiments efficiently on LUMI.
