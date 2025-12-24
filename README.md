# Awesome Terminals AI [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated AI-powered tools for terminal and command-line workflows.

## Contents

- [Introduction](#introduction)
- [General Purpose Chat & Shell Utilities](#general-purpose-chat--shell-utilities)
- [AI Coding Assistants & Agents](#ai-coding-assistants--agents)
  - [Autonomous Software Engineers](#autonomous-software-engineers)
  - [Interactive Pair Programmers](#interactive-pair-programmers)
  - [Provider-Native Coding CLIs](#provider-native-coding-clis)
- [Terminal Integration Tools](#terminal-integration-tools)
  - [Shell Enhancements](#shell-enhancements)
  - [AI-Enhanced Terminals](#ai-enhanced-terminals)
- [Tool Comparison](#tool-comparison)
- [Contribute](#contribute)


## Introduction

AI-powered assistants are transforming the command-line by integrating artificial intelligence directly into the shell. This streamlines workflows and makes the terminal a more powerful and intuitive environment.

These tools provide:

**Seamless Workflow** - Eliminates the need to copy and paste between your browser and terminal. Get suggestions, generate commands, and receive explanations directly in the command line.

**Shell Integration** - Pipe command outputs directly into AI assistants for analysis, summarization, or to generate subsequent commands.

**Terminal-Centric Workflows** - By bringing IDE-like features (e.g., code completion, natural language interaction) to the terminal, AI assistants empower a more focused and efficient workflow, reducing the reliance on heavier IDEs.

**Expanded Capabilities** - Job output analysis to instantly diagnose errors and receive fixes, natural language interaction to use plain English for commands, proactive error correction to fix typos before execution, code understanding and generation from descriptions, and simplified system administration for managing cloud resources and server configuration.

## General Purpose Chat & Shell Utilities

*Tools for general Q&A, text processing, and command-line assistance.*

- [llm](https://github.com/simonw/llm) - CLI tool and Python library for interacting with OpenAI, Anthropic's Claude, Google's Gemini, Meta's LLaMA and dozens of other LLMs. Features SQLite conversation storage, embeddings, structured content extraction, and extensive plugin system.
- [AIChat](https://github.com/sigoden/aichat) - All-in-one LLM CLI with Shell Assistant, Chat-REPL, RAG, AI Tools & Agents. Supports 20+ providers (OpenAI, Claude, Gemini, Ollama, Groq) with function calling, local server capabilities, and custom themes.
- [mods](https://github.com/charmbracelet/mods) - AI for command line pipelines from Charm. Designed to ingest command output and format results as Markdown, JSON, or other text formats. Supports OpenAI, Cohere, Groq, Azure OpenAI, and LocalAI.
- [tAI](https://github.com/bjarneo/tAI) - Terminal AI assistant that translates natural language to shell commands with interactive execution. Supports multiple providers (OpenAI, Google, Anthropic, Groq) with TUI setup and enhanced terminal UI.
- [anthropic-cli](https://github.com/dvcrn/anthropic-cli) - Unofficial CLI for interacting with Anthropic's Claude API. Supports text and image messages (PNG, JPEG, PDF), various parameters (temperature, top-k, top-p), and can be integrated with other command-line tools.
- [gemini-cli](https://github.com/Zibri/gemini-cli) - Unofficial CLI client for Google Gemini API written in C. Features Deep Mode prompting, key-free operation, multi-key management, file attachments, session management, and cross-platform support.
- [Grok CLI](https://grokcli.io/) - Official conversational AI CLI tool for interacting with xAI's Grok models.

## AI Coding Assistants & Agents

### Autonomous Software Engineers

*Agents capable of planning, executing, and managing complex, multi-step development tasks with high autonomy.*

- [Plandex](https://github.com/plandex-ai/plandex) - AI agent that plans and executes complex coding tasks across large codebases.
- [OpenHands](https://github.com/All-Hands-AI/OpenHands) - An AI software engineer agent that can execute complex tasks on your computer.
- [OpenCode](https://github.com/sst/opencode) - An AI-powered code generation tool that lets you build and iterate on ideas with AI.
- [ForgeCode](https://github.com/antinomyhq/forge) - An AI-powered development tool to help build, test, and deploy applications from the terminal.
- [Cline CLI](https://cline.bot/cline-cli) - An autonomous coding agent that can edit files, run terminal commands, and execute complex software development tasks directly from the CLI.
- [Factory Droid](https://factory.ai/product/cli) - An autonomous software engineering system designed to handle backlog tasks, refactoring, and feature development with minimal human intervention.
- [Goose CLI](https://github.com/block/goose) - An open-source developer agent from Block that automates engineering tasks, manages developer workflows, and executes complex instructions.

### Interactive Pair Programmers

*Assistants designed to work alongside you in the terminal or editor for code completion, refactoring, and immediate help.*

- [Aider](https://aider.chat/) - AI-powered pair programming tool for editing code directly in your local repo through natural language.
- [Cursor CLI](https://cursor.com/cli) - Command-line interface to run AI-assisted coding tasks and workflows with Cursor editor’s models.
- [Crush](https://github.com/charmbracelet/crush) - A terminal-based AI assistant and shell for software development with chat, code analysis, and LSP integration.
- [AMP CLI](https://www.npmjs.com/package/@sourcegraph/amp) - Sourcegraph's AI-powered CLI for code assistance.
- [RovoDev CLI](https://www.atlassian.com/blog/announcements/rovo-dev-command-line-interface) - Atlassian's AI-powered development assistant CLI.
- [Auggie CLI](https://augmentcode.com/docs/cli) - Context-aware AI coding CLI assistant from Augment Code.
- [Continue.Dev CLI](https://github.com/continuedev/continue) - The CLI interface for the popular open-source AI code assistant, enabling context-aware coding help and generation directly in the terminal.
- [Cody CLI](https://sourcegraph.com/docs/cody/clients/install-cli) - Sourcegraph's AI coding assistant brought to the command line, offering codebase-aware chat, code generation, and explanation capabilities.
- [Qodo CLI](https://docs.qodo.ai/qodo-documentation/qodo-command) - A quality-first AI assistant focused on code integrity, capable of generating comprehensive test suites and analyzing code behavior.
- [Kilocode CLI](https://kilo.ai/docs/cli) - An AI-powered coding tool designed to streamline development workflows with code generation and optimization features in the terminal.
- [Qoder CLI](https://qoder.com/cli) - An AI coding companion for the terminal that assists developers with writing, debugging, and understanding code through natural language.
- [LLxprt Code](https://github.com/vybestack/llxprt-code) - A specialized AI coding assistant designed to provide expert-level code explanations, debugging help, and generation.
- [iFlow CLI](https://github.com/iflow-ai/iflow-cli) - An AI-driven CLI tool for automating development workflows and streamlining coding processes through intelligent assistance.

### Provider-Native Coding CLIs

*Official CLI tools from major AI labs specifically optimized for their own coding models.*

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) - Official Anthropic CLI for general-purpose AI assistance, bringing the power of Claude to your terminal.
- [Gemini CLI](https://github.com/google-gemini/gemini-cli) - Official Google Gemini CLI with OAuth authentication, MCP support, built-in tools (Google Search, file ops, shell commands), and GitHub integration. Free tier: 60 requests/min, 1,000 requests/day.
- [OpenAI Codex CLI](https://github.com/openai/codex) - OpenAI's official CLI agent for general-purpose AI tasks that runs in your terminal.
- [Qwen Code CLI](https://github.com/QwenLM/qwen-code) - Official AI-powered workflow tool for general tasks, optimized for Qwen3-Coder models. Features conversation management and session control. Offers Qwen OAuth with 2,000 free requests/day.
- [GitHub Copilot CLI](https://github.com/github/copilot-cli) - The power of Copilot coding agent directly to your terminal.

## Terminal Integration Tools

### Shell Enhancements

- [ShellGPT](https://github.com/TheR1D/shell_gpt) - ChatGPT integration for shell commands.
- [zsh-ai](https://github.com/matheusml/zsh-ai) - AI-powered Zsh plugin.
- [TmuxAI](https://github.com/alvinunreal/tmuxai) - AI-powered plugin for Tmux that integrates ChatGPT into your terminal multiplexer.

### AI-Enhanced Terminals

- [Warp Terminal](https://www.warp.dev/) - AI-first terminal with intelligent agents for natural language command generation, real-time autosuggestions, error detection, voice commands, and multi-agent workflows. Features enterprise-grade security and configurable autonomy levels.
- [Wave Terminal](https://waveterm.dev/) - Open-source terminal with inline file previews, VSCode-like editor, web browser integration, SSH management, custom widgets, and AI assistance. Eliminates context switching with graphical capabilities in the command line.
- [iTerm2 AI Chat](https://iterm2.com/documentation-ai-chat.html) - Built-in AI integration for the popular macOS terminal emulator, allowing natural language command generation and explanation directly in the composer.

## Tool Comparison

|Tool                       |Cost Model                  |Model Flexibility             |Primary Use              |
|:--------------------------|:---------------------------|:-----------------------------|:------------------------|
|**General Purpose**        |                            |                              |                         |
|`llm`                      |API Key (BYOK*)             |User-configurable             |General Chat             |
|`AIChat`                   |Free (mostly)               |Selectable                    |General Chat             |
|`mods`                     |API Key (BYOK*)             |User-configurable             |General Chat             |
|`tAI`                      |API Key (BYOK*)             |User-configurable             |Shell Command Gen        |
|`anthropic-cli`            |API Key (Usage-based**)     |Bound (Anthropic)             |General Chat             |
|`gemini-cli`               |Free (API-less)             |Bound (Gemini)                |General Chat             |
|`Grok CLI`                 |Paid Subscription           |Bound (Grok)                  |General Chat             |
|**Autonomous Agents**      |                            |                              |                         |
|`Plandex`                  |API Key (BYOK*)             |User-configurable             |Code Assistant           |
|`OpenHands`                |API Key (BYOK*)             |User-configurable             |Code Generation          |
|`OpenCode`                 |API Key (BYOK*)             |User-configurable             |Code Generation          |
|`ForgeCode`                |API Key (BYOK*)             |User-configurable             |Code Generation          |
|`Cline CLI`                |Free (Open Source)          |User-configurable             |Autonomous Agent         |
|`Factory Droid`            |Paid (Enterprise)           |Bound (Factory)               |Autonomous Engineer      |
|`Goose CLI`                |Free (Open Source)          |User-configurable             |Autonomous Agent         |
|**Interactive Coding**     |                            |                              |                         |
|`Aider`                    |API Key (BYOK*)             |User-configurable             |Code Assistant           |
|`Cursor CLI`               |Freemium (+ Paid Plans)     |User-configurable             |Code Assistant           |
|`Crush`                    |Free (Shell) + API Key      |User-configurable             |AI Shell / Code Assistant|
|`AMP CLI`                  |Paid (Enterprise)           |Bound (Sourcegraph)           |Code Assistant           |
|`RovoDev CLI`              |Paid (Enterprise)           |Bound (Atlassian)             |Code Assistant           |
|`Auggie CLI`               |API Key (Paid)              |Bound (Augment)               |Code Assistant           |
|`Continue.Dev CLI`         |Free (Open Source)          |User-configurable             |Code Assistant           |
|`Cody CLI`                 |Freemium (+ Paid Plans)     |User-configurable             |Code Assistant           |
|`Qodo CLI`                 |Freemium (+ Paid Plans)     |Bound (Qodo)                  |Code Integrity/Test      |
|`Kilocode CLI`             |Freemium                    |User-configurable             |Code Assistant           |
|`Qoder CLI`                |Freemium                    |Bound (Qoder)                 |Code Assistant           |
|`LLxprt Code`              |Freemium                    |User-configurable             |Code Assistant           |
|`iFlow CLI`                |Freemium                    |User-configurable             |Workflow Automation      |
|**Provider-Native**        |                            |                              |                         |
|`Claude Code CLI`          |API Key (Usage-based**)     |User-configurable (via Router)|General Chat             |
|`Gemini CLI`               |API Key (Generous Free Tier)|Bound (Gemini)                |General Chat             |
|`OpenAI Codex CLI`         |API Key (Usage-based**)     |User-configurable             |General Chat             |
|`Qwen Code CLI`            |API Key (Generous Free Tier)|User-configurable             |General Chat             |
|`GitHub Copilot CLI`       |Freemium (+ Paid Plans)     |Bound (Copilot)               |Code/Shell Assistant     |
|**Shell & Terminal**       |                            |                              |                         |
|`ShellGPT`                 |API Key (BYOK*)             |User-configurable             |Shell Command Gen        |
|`zsh-ai`                   |API Key (BYOK*)             |User-configurable             |Shell Plugin             |
|`TmuxAI`                   |API Key (BYOK*)             |User-configurable             |Multiplexer Plugin       |
|`Warp Terminal`            |Freemium (+ Paid Plans)     |Bound (Built-in AI Agents)    |AI-Enhanced Terminal     |
|`Wave Terminal`            |Free (Open Source)          |User-configurable             |Multi-Feature Terminal   |
|`iTerm2 AI Chat`           |API Key (BYOK*)             |User-configurable             |AI-Enhanced Terminal     |

*\*BYOK (Bring Your Own Key): These tools act as clients and require you to provide your own API key from a model provider.*
*\*\*Usage-based: These APIs typically offer a small amount of free credits, after which the cost is based on usage (pay-as-you-go).*

## Contribute

Contributions welcome and wanted! Read the [contribution guidelines](CONTRIBUTING.md) first.