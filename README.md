# AI Tools in Terminal

A curated collection of AI-powered tools for terminal and command-line environments.

## Table of Contents

- [General Purpose AI Chat Tools](#general-purpose-ai-chat-tools)
- [Code-Focused AI Tools](#code-focused-ai-tools)
- [Terminal Integration Tools](#terminal-integration-tools)
- [Free API Providers](#free-api-providers)
- [Local Model Providers](#local-model-providers)
- [API Bridges and Proxies](#api-bridges-and-proxies)

## General Purpose AI Chat Tools

### Multi-Provider Chat Interfaces
- **[llm](https://github.com/simonw/llm)** - A command-line tool and Python library for interacting with Large Language Models, including OpenAI, PaLM, and local models.
- **[AIChat](https://github.com/sigoden/aichat)** - A powerful AI chat CLI that supports GPT-4, Gemini, Claude, and more, often without needing an API key.
- **[mods](https://github.com/charmbracelet/mods)** - AI on the command line from Charm; brings the power of large language models to your terminal.
- **[tAI](https://github.com/bjarneo/tAI)** - A terminal AI assistant that translates natural language to shell commands, supporting multiple providers (OpenAI, Google, Anthropic, Groq).

### Provider-Specific Tools
- **[anthropic-cli](https://github.com/dvcrn/anthropic-cli)** - An unofficial CLI for interacting with the Claude/Anthropic API.
- **[gemini-cli](https://github.com/Zibri/gemini-cli)** - An API-free command-line interface for Google Gemini.
- **[Gemini CLI](https://github.com/google-gemini/gemini-cli)** - The official Google Gemini command-line interface for interacting with the Gemini API.
- **[Qwen Code CLI](https://github.com/QwenLM/qwen-code)** - A command-line interface for Alibaba Cloud's Qwen large language models.
- **[Grok CLI](https://grokcli.io/)** - The official command-line interface for interacting with xAI's Grok.

## Code-Focused AI Tools

### AI Coding Assistants
- **[Aider](https://aider.chat/)** - AI pair programming in your terminal that lets you code with models like GPT-4 in your local git repository.
- **[Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code)** - Official Anthropic CLI for code assistance, bringing the power of Claude to your terminal.
- **[GitHub Copilot CLI](https://cli.github.com/manual/gh_copilot)** - GitHub's AI assistant for the command line, providing a chat-like interface for shell and git commands.
- **[Cursor CLI](https://cursor.com/cli)** - A command-line interface for the AI-first code editor, Cursor.
- **[Plandex](https://github.com/plandex-ai/plandex)** - A terminal-based AI coding engine designed for complex, long-running tasks.
- **[Crush](https://github.com/charmbracelet/crush)** - A terminal-based AI assistant and shell for software development with chat, code analysis, and LSP integration.

### Code Generation and Analysis
- **[OpenCode](https://github.com/sst/opencode)** - An AI-powered code generation tool that lets you build and iterate on ideas with AI.
- **[OpenHands](https://github.com/All-Hands-AI/OpenHands)** - An AI software engineer agent that can execute complex tasks on your computer.
- **[ForgeCode](https://github.com/antinomyhq/forge)** - An AI-powered development tool to help build, test, and deploy applications from the terminal.
- **[Auggie CLI](https://docs.augmentcode.com/cli/overview)** - Context-aware AI coding CLI assistant from Augment Code.
- **[OpenAI Codex CLI](https://github.com/openai/codex)** - OpenAI's new lightweight coding agent that runs in your terminal.

### Enterprise Solutions
- **[AMP CLI](https://www.npmjs.com/package/@sourcegraph/amp)** - Sourcegraph's AI-powered CLI
- **[RovoDev CLI](https://www.atlassian.com/blog/announcements/rovo-dev-command-line-interface)** - Atlassian's AI-powered development assistant CLI


## Terminal Integration Tools

### Shell Enhancements
- **[ShellGPT](https://github.com/TheR1D/shell_gpt)** - ChatGPT integration for shell commands
- **[zsh-ai](https://github.com/matheusml/zsh-ai)** - AI-powered Zsh plugin

### AI-Enhanced Terminals
- **[Warp Terminal](https://www.warp.dev/)** - Modern terminal with AI command suggestions
- **[Wave Terminal](https://waveterm.dev/)** - Next-generation terminal with AI integration

## Tool Comparison

| Tool | Cost Model | Model Flexibility | Primary Use |
| :--- | :--- | :--- | :--- |
| **General Purpose** | | | |
| `llm` | API Key (BYOK*) | User-configurable | General Chat |
| `AIChat` | Free (mostly) | Selectable | General Chat |
| `mods` | API Key (BYOK*) | User-configurable | General Chat |
| `tAI` | API Key (BYOK*) | User-configurable | Shell Command Gen |
| `anthropic-cli`| API Key (Usage-based**) | Bound (Anthropic) | General Chat |
| `gemini-cli` | Free (API-less) | Bound (Gemini) | General Chat |
| `Gemini CLI` | API Key (Generous Free Tier) | Bound (Gemini) | General Chat |
| `Qwen Code CLI`| API Key (Generous Free Tier) | Bound (Qwen) | General Chat |
| `Grok CLI` | Paid Subscription | Bound (Grok) | General Chat |
| **Coding Assistants** | | | |
| `Aider` | API Key (BYOK*) | User-configurable | Code Assistant |
| `Claude Code CLI`| API Key (Usage-based**) | Bound (Anthropic) | Code Assistant |
| `GitHub Copilot CLI`| Paid Subscription | Bound (Copilot) | Code/Shell Assistant |
| `Cursor CLI` | Freemium | User-configurable | Code Assistant |
| `Plandex` | API Key (BYOK*) | User-configurable | Code Assistant |
| `Crush` | Free (Shell) + API Key | User-configurable | AI Shell / Code Assistant |
| **Code Generation** | | | |
| `OpenCode` | API Key (BYOK*) | User-configurable | Code Generation |
| `OpenHands` | API Key (BYOK*) | User-configurable | Code Generation |
| `ForgeCode` | API Key (BYOK*) | User-configurable | Code Generation |
| `Auggie CLI` | API Key (Paid) | Bound (Augment) | Code Assistant |
| `OpenAI Codex CLI`| API Key (Usage-based**) | Bound (OpenAI) | Code Assistant |
| **Shell & Terminal** | | | |
| `ShellGPT` | API Key (BYOK*) | User-configurable | Shell Command Gen |
| `zsh-ai` | API Key (BYOK*) | User-configurable | Shell Plugin |
| `Warp Terminal`| Freemium | Bound (Built-in) | Terminal |
| `Wave Terminal`| Free | User-configurable | Terminal |
| **Enterprise** | | | |
| `AMP CLI` | Paid (Enterprise) | Bound (Cody) | Code Assistant |
| `RovoDev CLI` | Paid (Enterprise) | Bound (Atlassian) | Code Assistant |

*\*BYOK (Bring Your Own Key): These tools act as clients and require you to provide your own API key from a model provider.*
*\*\*Usage-based: These APIs typically offer a small amount of free credits, after which the cost is based on usage (pay-as-you-go).*

## Free API Providers

### Gemini API

The free tier allows you to use the *Gemini-2.5-Pro* make **5 requests per minutes, and 100 requests
per day**. You an find more details at
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
- **Rate Limits**: 8k input tokens, 4k output tokens per request

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

**Free Models Available**:
- [GPT OSS 20B (free)](https://openrouter.ai/openai/gpt-oss-20b:free)
- [Qwen3 Coder (free)](https://openrouter.ai/qwen/qwen3-coder:free)
- [GLM 4.5 Air (free)](https://openrouter.ai/z-ai/glm-4.5-air:free)
- [Kimi K2 (free)](https://openrouter.ai/moonshotai/kimi-k2:free)

**Setup**: Generate API key at [OpenRouter Settings](https://openrouter.ai/settings/keys)

### Groq

[Groq](https://console.groq.com/) offers high-speed inference with free tier access.

**Free Models Available**:
- openai/gpt-oss-120b
- openai/gpt-oss-20b
- qwen/qwen3-32b
- moonshotai/kimi-k2-instruct

**Rate Limits**: [View current limits](https://console.groq.com/docs/rate-limits)
**Setup**: Generate API key at [Groq Console](https://console.groq.com/keys)

## Local Model Providers

### Self-Hosted Solutions
- **[Ollama](https://ollama.ai/)** - Run large language models locally
- **[LM Studio](https://lmstudio.ai/)** - Desktop application for running local LLMs

## API Bridges and Proxies

### Compatibility Bridges

Most AI tools support OpenAI-compatible APIs. For tools requiring Anthropic-compatible APIs, these bridges help:

#### Claude Code Router
- **[Claude Code Router](https://github.com/musistudio/claude-code-router)** - Routes Claude Code requests to different models with request customization

#### Copilot API Bridge
- **[copilot-api](https://github.com/ericc-ch/copilot-api)** - Converts GitHub Copilot into OpenAI/Anthropic API compatible server for use with Claude Code

**Deployment Example (Singularity/CVMFS)**:
The `copilot-api` tool is available in the modern-linuxtools Singularity image on CVMFS:

```bash
# Setup the environment
$ source /cvmfs/atlas.sdcc.bnl.gov/users/yesw/singularity/alma9-x86/modern-linuxtools/setupMe.sh

# Start the API wrapper
$ copilot-api start -c
[...]
  ➜ Listening on: http://130.199.48.146:4141/

# In another terminal, use with Aider
$ export ANTHROPIC_BASE_URL=http://130.199.48.146:4141 && aider --no-git --anthropic-api-key dummy --model anthropic/claude-sonnet-4

# Or use with Claude Code CLI (also included in modern-linuxtools)
$ export ANTHROPIC_BASE_URL=http://130.199.48.146:4141 && claude-code
```

**Important Notes**:
- Use your own URL in the `ANTHROPIC_BASE_URL` environment variable and remove the trailing '/'
- Enable X11 forwarding when SSH-ing to remote hosts (required by xsel in the wrapper): `ssh -X username@hostname`
- With this API wrapper, all GitHub Copilot models (not including the Market models) become accessible through Claude Code CLI

## Usage Guides

### Getting Started
1. Choose a tool based on your needs (general chat vs. code assistance)
2. Set up API keys for your preferred provider
3. Install the CLI tool using the provider's instructions
4. Configure authentication and start using

### Best Practices
- Use code-focused tools for programming tasks
- Leverage free APIs for experimentation
- Consider local models for privacy-sensitive work
- Use API bridges to integrate different tools

### Detailed Tool Guides

#### Aider
*Detailed usage guide and examples for Aider will be added here*

#### Claude Code
*Detailed usage guide and examples for Claude Code will be added here*

#### Gemini CLI
*Detailed usage guide and examples for Gemini CLI will be added here*

#### Warp Terminal
*Detailed usage guide and examples for Warp Terminal will be added here*

#### Wave Terminal
*Detailed usage guide and examples for Wave Terminal will be added here*

## Git Source Code Review

### GitLab Integration
- MR Review tools for GitLab (implementation details to be added)

---

*This list is continuously updated. Contributions and suggestions are welcome!*