# Qwen Code

Qwen Code is a command-line interface tool designed for code understanding and editing. It's optimized for Qwen-Coder models and adapts the Qwen CLI for enhanced code comprehension capabilities.

GitHub Repository: [https://github.com/QwenLM/qwen-code](https://github.com/QwenLM/qwen-code)

## Key Features

- **Code Understanding & Editing**: Query and edit large codebases beyond traditional context window limits
- **Workflow Automation**: Automate operational tasks like handling pull requests and complex rebases
- **Enhanced Parser**: Adapted parser specifically optimized for Qwen-Coder models
- **Session Management**: Control token usage with configurable session limits

## Installation

### Prerequisites
Node.js version 20 or higher

### Options

1. **NPM Installation**:
   ```bash
   npm install -g @qwen-code/qwen-code@latest
   qwen --version
   ```

2. **From Source**:
   ```bash
   git clone https://github.com/QwenLM/qwen-code.git
   cd qwen-code
   npm install
   npm install -g .
   ```

3. **Homebrew** (macOS/Linux):
   ```bash
   brew install qwen-code
   ```

## Usage Examples

### Starting Qwen Code
```bash
qwen
```

### Codebase Exploration
- `Describe the main pieces of this system's architecture`
- `What are the key dependencies and how do they interact?`
- `Find all API endpoints and their authentication methods`

### Code Development
- `Refactor this function to improve readability and performance`
- `Create a REST API endpoint for user management`
- `Generate unit tests for the authentication module`

### Workflow Automation
- `Analyze git commits from the last 7 days, grouped by feature`
- `Convert all images in this directory to PNG format`
- `Find and remove all console.log statements`

### Debugging & Analysis
- `Identify performance bottlenecks in this React component`
- `Check for potential SQL injection vulnerabilities`

## Authentication

Qwen Code offers several free options:
1. **Qwen OAuth** (Recommended): 2,000 requests per day with automatic credential management
2. **Regional Free Tiers**: ModelScope (China) and OpenRouter (International) offer free API calls

The tool is specifically optimized for Qwen3-Coder models and adapts the Gemini CLI for enhanced code understanding capabilities.