# AI Tools in Terminal

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

A curated collection of AI-powered tools for terminal and command-line environments. Whether you're looking to enhance your coding workflow, get AI assistance with shell commands, or integrate powerful language models into your development process, this guide will help you find the perfect tool for your needs.

## Table of Contents

- [Introduction](#introduction)
- [General Purpose AI Chat Tools](#general-purpose-ai-chat-tools)
- [Code-Focused AI Tools](#code-focused-ai-tools)
- [Terminal Integration Tools](#terminal-integration-tools)
- [Tool Comparison](#tool-comparison)
- [Free API Providers](#free-api-providers)
- [Local Model Providers](#local-model-providers)
- [Usage Guides](#usage-guides)
- [Companion Toolkit](#companion-toolkit)


## Introduction

AI-powered assistants are transforming the command-line by integrating artificial intelligence directly into the shell. This streamlines workflows and makes the terminal a more powerful and intuitive environment.

Here’s how they help:

* **Seamless Workflow**: Eliminates the need to copy and paste between your browser and terminal. Get suggestions, generate commands, and receive explanations directly in the command line.
* **Shell Integration**: Pipe command outputs directly into AI assistants for analysis, summarization, or to generate subsequent commands.
* **Shift to Terminal-Centric Workflows**: By bringing IDE-like features (e.g., code completion, natural language interaction) to the terminal, AI assistants empower a more focused and efficient workflow, reducing the reliance on heavier IDEs.
* **Expanded Capabilities**:
    * **Job Output Analysis**: Instantly analyze the output from scripts and commands to diagnose errors and receive suggested fixes.
    * **Natural Language Interaction**: Use plain English to get the right commands.
    * **Proactive Error Correction**: Automatically detect and fix typos in your commands before you run them.
    * **Code Understanding & Generation**: Analyze code and generate snippets from descriptions.
    * **System Administration**: Simplify complex tasks like managing cloud resources and server configuration.

## General Purpose AI Chat Tools

### Multi-Provider Chat Interfaces

- **[llm](https://github.com/simonw/llm)** - CLI tool and Python library for interacting with OpenAI, Anthropic's Claude, Google's Gemini, 
    Meta's Llama and dozens of other LLMs. Features SQLite conversation storage, embeddings, structured content extraction, and extensive plugin system.
- **[AIChat](https://github.com/sigoden/aichat)** - All-in-one LLM CLI with Shell Assistant, Chat-REPL, RAG, AI Tools & Agents. 
    Supports 20+ providers (OpenAI, Claude, Gemini, Ollama, Groq) with function calling, local server capabilities, and custom themes.
- **[mods](https://github.com/charmbracelet/mods)** - AI for command line pipelines from Charm. Designed to ingest command output 
    and format results as Markdown, JSON, or other text formats. Supports OpenAI, Cohere, Groq, Azure OpenAI, and LocalAI.
- **[tAI](https://github.com/bjarneo/tAI)** - Terminal AI assistant that translates natural language to shell commands with 
    interactive execution. Supports multiple providers (OpenAI, Google, Anthropic, Groq) with TUI setup and enhanced terminal UI.
- **[anthropic-cli](https://github.com/dvcrn/anthropic-cli)** - Unofficial CLI for interacting with Anthropic's Claude API. 
    Supports text and image messages (PNG, JPEG, PDF), various parameters (temperature, top-k, top-p), and can be integrated with other command-line tools.
- **[gemini-cli](https://github.com/Zibri/gemini-cli)** - Unofficial CLI client for Google Gemini API written in C. Features Deep 
    Mode prompting, key-free operation, multi-key management, file attachments, session management, and cross-platform support.

### Provider-Specific Tools

- **[Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code)** - Official Anthropic CLI for general-purpose AI assistance, 
    bringing the power of Claude to your terminal.
- **[Gemini CLI](https://github.com/google-gemini/gemini-cli)** - Official Google Gemini CLI with OAuth authentication, MCP support, 
    built-in tools (Google Search, file ops, shell commands), and GitHub integration. Free tier: 60 requests/min, 1,000 requests/day.
- **[OpenAI Codex CLI](https://github.com/openai/codex)** - OpenAI's official CLI agent for general-purpose AI tasks that runs in your terminal.
- **[Qwen Code CLI](https://github.com/QwenLM/qwen-code)** - Official AI-powered workflow tool for general tasks, optimized for Qwen3-Coder models. 
    Features conversation management and session control. Offers Qwen OAuth with 2,000 free requests/day.
- **[Grok CLI](https://grokcli.io/)** - Official conversational AI CLI tool for interacting with xAI's Grok models.

## Code-Focused AI Tools

### AI Coding Assistants

- **[Aider](https://aider.chat/)** - AI-powered pair programming tool for editing code directly in your local repo through natural language
- **[GitHub Copilot CLI](https://github.com/github/copilot-cli)** - The power of Copilot coding agent directly to your terminal.
- **[Cursor CLI](https://cursor.com/cli)** - Command-line interface to run AI-assisted coding tasks and workflows with Cursor editor’s models.
- **[Plandex](https://github.com/plandex-ai/plandex)** - AI agent that plans and executes complex coding tasks across large codebases.
- **[Crush](https://github.com/charmbracelet/crush)** - A terminal-based AI assistant and shell for software development with chat, 
    code analysis, and LSP integration.
- **[AMP CLI](https://www.npmjs.com/package/@sourcegraph/amp)** - Sourcegraph's AI-powered CLI for code assistance.
- **[RovoDev CLI](https://www.atlassian.com/blog/announcements/rovo-dev-command-line-interface)** - Atlassian's AI-powered development assistant CLI.
- **[Auggie CLI](https://docs.augmentcode.com/cli/overview)** - Context-aware AI coding CLI assistant from Augment Code.

### Code Generation and Analysis

- **[OpenCode](https://github.com/sst/opencode)** - An AI-powered code generation tool that lets you build and iterate on ideas with AI.
- **[OpenHands](https://github.com/All-Hands-AI/OpenHands)** - An AI software engineer agent that can execute complex tasks on your computer.
- **[ForgeCode](https://github.com/antinomyhq/forge)** - An AI-powered development tool to help build, test, and deploy applications from the terminal.

## Terminal Integration Tools

### Shell Enhancements

- **[ShellGPT](https://github.com/TheR1D/shell_gpt)** - ChatGPT integration for shell commands
- **[zsh-ai](https://github.com/matheusml/zsh-ai)** - AI-powered Zsh plugin

### AI-Enhanced Terminals

- **[Warp Terminal](https://www.warp.dev/)** - AI-first terminal with intelligent 
    agents for natural language command generation, real-time autosuggestions, 
    error detection, voice commands, and multi-agent workflows. 
    Features enterprise-grade security and configurable autonomy levels.
- **[Wave Terminal](https://waveterm.dev/)** - Open-source terminal with inline 
    file previews, VSCode-like editor, web browser integration, SSH management, 
    custom widgets, and AI assistance. Eliminates context switching with graphical capabilities in the command line.

## Tool Comparison

| Tool                        | Cost Model                   | Model Flexibility              | Primary Use               |
| :-------------------------- | :--------------------------- | :----------------------------- | :------------------------ |
| **General Purpose**       |                              |                                |                           |
| `llm`                     | API Key (BYOK*)              | User-configurable              | General Chat              |
| `AIChat`                  | Free (mostly)                | Selectable                     | General Chat              |
| `mods`                    | API Key (BYOK*)              | User-configurable              | General Chat              |
| `tAI`                     | API Key (BYOK*)              | User-configurable              | Shell Command Gen         |
| `anthropic-cli`           | API Key (Usage-based**)      | Bound (Anthropic)              | General Chat              |
| `gemini-cli`              | Free (API-less)              | Bound (Gemini)                 | General Chat              |
| `Gemini CLI`              | API Key (Generous Free Tier) | Bound (Gemini)                 | General Chat              |
| `Claude Code CLI`         | API Key (Usage-based**)      | User-configurable (via Router) | General Chat              |
| `Qwen Code CLI`           | API Key (Generous Free Tier) | User-configurable              | General Chat              |
| `OpenAI Codex CLI`        | API Key (Usage-based**)      | User-configurable              | General Chat              |
| `Grok CLI`                | Paid Subscription            | Bound (Grok)                   | General Chat              |
| **Coding Assistants**     |                              |                                |                           |
| `Aider`                   | API Key (BYOK*)              | User-configurable              | Code Assistant            |
| `GitHub Copilot CLI`      | Freemium (+ Paid Plans)      | Bound (Copilot)                | Code/Shell Assistant      |
| `Cursor CLI`              | Freemium (+ Paid Plans)      | User-configurable              | Code Assistant            |
| `Plandex`                 | API Key (BYOK*)              | User-configurable              | Code Assistant            |
| `Crush`                   | Free (Shell) + API Key       | User-configurable              | AI Shell / Code Assistant |
| `AMP CLI`                 | Paid (Enterprise)            | Bound (Sourcegraph)            | Code Assistant            |
| `RovoDev CLI`             | Paid (Enterprise)            | Bound (Atlassian)              | Code Assistant            |
| `Auggie CLI`              | API Key (Paid)               | Bound (Augment)                | Code Assistant            |
| **Code Generation**       |                              |                                |                           |
| `OpenCode`                | API Key (BYOK*)              | User-configurable              | Code Generation           |
| `OpenHands`               | API Key (BYOK*)              | User-configurable              | Code Generation           |
| `ForgeCode`               | API Key (BYOK*)              | User-configurable              | Code Generation           |
| **Shell & Terminal**      |                              |                                |                           |
| `ShellGPT`                | API Key (BYOK*)              | User-configurable              | Shell Command Gen         |
| `zsh-ai`                  | API Key (BYOK*)              | User-configurable              | Shell Plugin              |
| `Warp Terminal`           | Freemium (+ Paid Plans)      | Bound (Built-in AI Agents)     | AI-Enhanced Terminal      |
| `Wave Terminal`           | Free (Open Source)           | User-configurable              | Multi-Feature Terminal    |

*\*BYOK (Bring Your Own Key): These tools act as clients and require you to provide your own API key from a model provider.*
*\*\*Usage-based: These APIs typically offer a small amount of free credits, after which the cost is based on usage (pay-as-you-go).*

## Free API Providers

### Gemini API

The free tier allows you to use the *Gemini-2.5-Pro* to make **5 requests per minute, and 100 requests
per day**. You can find more details at
https://ai.google.dev/gemini-api/docs/rate-limits.

The API key can be created at https://aistudio.google.com/app/apikey.

### GitHub Models

GitHub provides two types of AI model access:

#### GitHub Copilot Models

- **Endpoint**: `https://api.githubcopilot.com`
- **Documentation**: [Supported Models](https://docs.github.com/en/copilot/reference/ai-models/supported-models)
- **Rate Limits**: 300 premium requests/month (Copilot Pro)

List available models:

```bash
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${OAUTH_TOKEN}" \
  https://api.githubcopilot.com/models | jq -r '.data[].id'
```

#### GitHub Market Models

- **Endpoint**: `https://models.github.ai/inference`
- **Browse Models**: [GitHub Marketplace Models](https://github.com/marketplace/models)
- **Rate Limits**: 4k input tokens, 4k output tokens per request

List available models:

```bash
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${OAUTH_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://models.github.ai/catalog/models | jq -r '.[].id'
```

### OpenRouter

[OpenRouter](https://openrouter.ai/) provides unified API access to multiple AI models.
You can try different models using one API, and find your best fit.

**Free Models Available**:

- [GPT OSS 20B (free)](https://openrouter.ai/openai/gpt-oss-20b:free)
- [Qwen3 Coder (free)](https://openrouter.ai/qwen/qwen3-coder:free)
- [GLM 4.5 Air (free)](https://openrouter.ai/z-ai/glm-4.5-air:free)
- [Kimi K2 (free)](https://openrouter.ai/moonshotai/kimi-k2:free)
- [deepseek-chat-v3.1:free](https://openrouter.ai/deepseek/deepseek-chat-v3.1:free)

**Setup**: Generate API key at [OpenRouter Settings](https://openrouter.ai/settings/keys)

**Rate Limits**: If you have purchased at least 10 credits, your free model rate limit will be 1000 requests per day. Otherwise, you will be rate limited to 50 free model API requests per day.

### Groq

[Groq](https://console.groq.com/) offers high-speed inference with free tier access.

You can find the available free models in the [Rate
Limits](https://console.groq.com/docs/rate-limits) documentation:

- openai/gpt-oss-120b
- openai/gpt-oss-20b
- qwen/qwen3-32b
- moonshotai/kimi-k2-instruct-0905

**Setup**: Generate API key at [Groq Console](https://console.groq.com/keys)

## Local Model Providers

### Ollama

**[Ollama](https://ollama.ai/)** - Lightweight framework for running LLMs locally via command line. 
Features simple CLI interface, RESTful API, Docker-like model management, and supports popular models like Llama, 
Gemma, and DeepSeek. Cross-platform with OpenAI-compatible API.

#### Ollama Model Performance

**Model Sizes:**
- gpt-oss:120b: 65 GB
- gpt-oss:20b: 13 GB
- qwen3:8b: 5.2 GB
- qwen3:30b: 18 GB

| Machine | gpt-oss:120b | gpt-oss:20b | qwen3:8b | qwen3:30b |
| :--- | :---: | :---: | :---: | :---: |
| **Windows PC (Intel i9)** | - | 15 t/s | 12 t/s | 22 t/s |
| **MacBook Pro (M3 Max)** | - | 70 t/s | 57 t/s | 74 t/s |
| **Linux Server (Dual RTX 4090)** | 36 t/s | 156 t/s | 140 t/s | 163 t/s |

**Machine Specifications:**
- **Windows PC (Intel i9)**: CPU: Intel i9-12900, GPU: Intel UHD Graphics 770 (2 GB), RAM: 64 GB
- **MacBook Pro (M3 Max)**: Apple M3 Max with 64 GB RAM
- **Linux Server (Dual RTX 4090)**: CPU: Xeon(R) w7-3445 (40 CPUs), GPU: 2 Nvidia RTX 4090, RAM: 128 GB

### LM Studio

**[LM Studio](https://lmstudio.ai/)** - User-friendly desktop GUI for running local LLMs with no 
technical setup required. Features model marketplace, OpenAI-compatible API server, chat interface, 
and support for GGUF models. Free for personal and commercial use.

## Usage Guides

### Getting Started

1. **Choose your tool**: Browse the sections above to find a tool that matches your needs (general chat, code assistance, or terminal enhancement)
2. **Set up API access**: Most tools require API keys from providers like OpenAI, Anthropic, or Google - check the [Free API Providers](#free-api-providers) section for free options
3. **Install the tool**: Follow the installation instructions provided by each tool's documentation
4. **Configure and enjoy**: Set up authentication and start enhancing your terminal workflow with AI!

### Best Practices

- Use code-focused tools for programming tasks
- Leverage free APIs for experimentation
- Consider local models for privacy-sensitive work


## Companion Toolkit

For detailed guides, scripts, and other resources to help you get the most out of these tools, check out the [terminal-ai-toolkit](https://github.com/BNLNPPS/terminal-ai-toolkit) repository.

---

*This list is continuously updated with the latest AI terminal tools. Contributions, suggestions, and feedback are always welcome! Feel free to open an issue or submit a pull request to help make this resource even better.*
