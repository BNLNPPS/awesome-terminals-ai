# Gemini CLI

Gemini CLI is an open-source AI agent that brings the power of Google's Gemini 
directly into your terminal. It's designed for developers who prefer working 
in command-line environments.

GitHub Repository: [https://github.com/google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli)

## Key Features

- **Code Understanding & Generation**: Query and edit large codebases, generate new apps from various inputs (PDFs, images, sketches), and debug issues using natural language
- **Automation & Integration**: Automate operational tasks, use MCP servers for extended capabilities, and run in non-interactive mode for workflow automation
- **Advanced Features**: Google Search grounding for real-time information, conversation checkpointing to save sessions, and custom context files (GEMINI.md) for project-specific behavior
- **Free Tier Access**: 60 requests/minute and 1,000 requests/day with personal Google account
- **Powerful Model**: Access to Gemini 2.5 Pro with 1M token context window
- **Built-in Tools**: File operations, shell commands, web fetching, and Google Search integration
- **Extensibility**: MCP (Model Context Protocol) support for custom integrations

## Installation

### Prerequisites
Node.js version 20 or higher

### Options

1. **NPM Installation**:
   ```bash
   npm install -g @google/gemini-cli
   ```

2. **Homebrew** (macOS/Linux):
   ```bash
   brew install google-gemini/tap/gemini
   ```

## Authentication Options

1. **OAuth Login**: Best for individual developers with Google account authentication
2. **Gemini API Key**: For developers needing specific model control
3. **Vertex AI**: For enterprise teams requiring advanced security and compliance

Note: Under the Google account authentication, the model could be automatically 
switched to the *flash* model after a few prompts.

## Usage Examples

### Starting Gemini CLI
```bash
gemini
```

### Codebase Exploration
- `Explain how the authentication system works in this project`
- `Find all API endpoints and their rate limits`
- `What are the key dependencies and how do they interact?`

### Code Development
- `Generate a new React component for user profiles`
- `Refactor this function to improve readability`
- `Create unit tests for the payment processing module`

### Workflow Automation
- `Automate the process of updating dependencies`
- `Run a security audit on all package.json files`
- `Format all code according to project standards`

### Debugging & Analysis
- `Help me understand this error log`
- `Identify potential performance bottlenecks`
- `Check for security vulnerabilities in this code`
