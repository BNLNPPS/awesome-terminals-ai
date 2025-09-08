# Aider

Aider is an AI-powered terminal-based coding tool that enables AI pair programming directly in your local git repository. It brings the power of large language models (LLMs) directly to your command line, allowing you to collaborate with AI on code editing tasks.

## Installation

To install Aider, you can use pip:

```bash
pip install aider-chat
```

After installation, you can run Aider by simply typing:
```bash
aider
```

### Optional Installation Steps

1. **Install Git**: Aider works best with Git repositories for tracking changes
2. **API Keys**: Set up API keys for the LLM providers you want to use (OpenAI, Anthropic, etc.)

### Alternative Installation Methods

- **Docker**: Aider can be run in Docker containers
- **GitHub Codespaces**: Ready-to-use development environment
- **Replit**: Browser-based coding environment

## Basic Usage

Aider is AI pair programming in your terminal that works with your local Git repository. Here are some basic usage examples:

### Starting Aider

1. Navigate to your project directory:
   ```bash
   cd /path/to/your/project
   ```

2. Run aider:
   ```bash
   aider
   ```

### Common In-Chat Commands

- `/add filename`: Add a file to the chat context
- `/drop filename`: Remove a file from the chat context
- `/clear`: Clear the chat history and start fresh
- `/model model_name`: Switch to a different LLM
- `/undo`: Undo the last git commit
- `/ls`: List all files in the repository
- `/run command`: Execute shell commands
- `/test command`: Run test commands with automatic error fixing
- `/help`: Show available commands

### Basic Workflow Examples

1. **Creating a new file**:
   ```
   user: Create a new Python file called hello.py that prints "Hello, World!"
   ```

2. **Modifying an existing file**:
   ```
   user: Can you add a function to calculate the factorial of a number in math_utils.py?
   ```

3. **Working with multiple files**:
   ```
   user: I need to update the README.md to document the new factorial function I added to math_utils.py
   ```

## Main Features

### Multi-LLM Support
Aider can connect to a wide range of LLMs including:
- OpenAI, Anthropic, Gemini, GROQ
- LM Studio, xAI, Azure, Cohere, DeepSeek
- Ollama, OpenAI compatible APIs, OpenRouter
- GitHub Copilot, Vertex AI, Amazon Bedrock

### Advanced Editing Capabilities
- **Chat Modes**: Different modes including code, architect, ask, and help
- **In-Chat Commands**: Control aider with commands like `/add`, `/model`, etc.
- **Voice-to-Code**: Speak with aider about your code
- **Image & Web Page Integration**: Add images and web pages to coding chats
- **Prompt Caching**: For cost savings and faster coding
- **IDE Integration**: Works with your favorite IDE or text editor
- **Browser Support**: Can run in your browser in addition to command line

### Development Workflow Features
- **Git Integration**: Tightly integrated with git for version control
- **Repository Mapping**: Uses a map of your git repository to provide code context to LLMs
- **Linting and Testing**: Automatically fix linting and testing errors
- **Configuration File Editing**: Edit config files, documentation, and other text-based formats
- **Scripting Support**: Can be scripted via command line or Python
- **Multiple Language Support**: Supports most popular coding languages
- **Shell Command Execution**: Run and fix shell commands and scripts with automatic error detection and repair

### Configuration & Customization
- **Flexible Configuration**: YAML config files, .env files for API keys
- **Model Aliases**: Assign convenient short names to models
- **Advanced Model Settings**: Configure reasoning models and advanced LLM settings
- **Coding Conventions**: Specify coding conventions for AI to follow

### Detailed Configuration Examples

#### Multiple API Keys Configuration

You can configure multiple API keys in your `.aider.conf.yml` file:

```yaml
# API Keys for different providers
api-key:
  - gemini=AIzaSyDWk2...
  - openrouter=sk-or-v1-...
  - groq=gsk_...
  - openai=sk-...
  - anthropic=sk-ant-...
```

Alternatively, you can use environment variables in your `.env` file:
```env
GEMINI_API_KEY=AIzaSyDWk2...
OPENROUTER_API_KEY=sk-or-v1-...
GROQ_API_KEY=gsk_...
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
```

#### Model Aliases Configuration

Create convenient shortcuts for frequently used models:

```yaml
# aliases for models
alias:
  - "gemini-2.5-flash:gemini/gemini-2.5-flash-preview-05-20"
  - "gemini-2.5-pro:gemini/gemini-2.5-pro-exp-03-25"
  - "ds-r1:groq/deepseek-r1-distill-llama-70b"
  - "kimi-k2:groq/moonshotai/kimi-k2-instruct-0905"
  - "qwen3-32b:groq/qwen/qwen3-32b"
  - "or-ds-r1:openrouter/deepseek/deepseek-r1:free"
  - "or-qwen3-coder:openrouter/qwen/qwen3-coder:free"
  - "or-ds-v3.1:openrouter/deepseek/deepseek-chat-v3.1:free"
  - "or-glm4.5-air:openrouter/z-ai/glm-4.5-air:free"
  - "llama-3:groq/llama3-70b-8192"
  - "or-mistral:openrouter/mistralai/mistral-7b-instruct"
```

Once configured, you can use these aliases with the `/model` command:
```
/model gemini-2.5-pro
/model or-qwen3-coder
/model ds-r1
```

#### Using Configuration Files

Create a `.aider.conf.yml` file in your home directory or project root:

```yaml
# .aider.conf.yml
model: gemini-2.5-flash
api-key:
  - gemini=AIzaSyDWk2...
  - openrouter=sk-or-v1-...
  - groq=gsk_...
alias:
  - "flash:gemini/gemini-2.5-flash-preview-05-20"
  - "pro:gemini/gemini-2.5-pro-exp-03-25"
  - "ds-r1:groq/deepseek-r1-distill-llama-70b"
dark-mode: true
auto-test: true
test-cmd: "python -m pytest tests/"
```

### Additional Features
- **Notifications**: Get notified when aider is waiting for your input
- **Copy/Paste with Web Chat**: Works with LLM web chat UIs
- **Infinite Output**: Handle "infinite output" from models that support prefill
- **Edit Formats**: Various formats for LLMs to edit source files
- **Analytics**: Opt-in anonymous analytics with no personal information

## File Watching Capability

Aider's file watching feature allows you to use AI coding instructions directly in your code files through special comments. To use this feature, run aider with the `--watch-files` option.

### Using the --watch-files Option

To enable file watching, start aider with the `--watch-files` flag:

```bash
aider --watch-files
```

This will monitor all files in your repository for special AI comments and automatically respond to them.

### How It Works

Aider looks for one-liner comments that start or end with `AI`, `AI!`, or `AI?`:
- `# Make a snake game. AI!` (Python-style)
- `// Write a protein folding prediction engine. AI!` (JavaScript-style)
- `-- Add error handling. AI!` (SQL-style)

### Special Comment Types

1. **`AI!`** - Triggers aider to make changes to your code
2. **`AI?`** - Triggers aider to answer your question

### Examples

1. **Simple Implementation Request**:
   ```javascript
   function factorial(n) // Implement this. AI!
   ```
   Aider would then implement the function:
   ```javascript
   function factorial(n) {
     if (n === 0 || n === 1) {
       return 1;
     } else {
       return n * factorial(n - 1);
     }
   }
   ```

2. **In-Context Instructions**:
   ```javascript
   app.get('/sqrt/:n', (req, res) => {
       const n = parseFloat(req.params.n);
   
       // Add error handling for NaN and less than zero. AI!
   
       const result = math.sqrt(n);
       res.json({ result: result });
   });
   ```

3. **Multiple Comments**:
   ```python
   @app.route('/factorial/<int:n>')
   def factorial(n):
       if n < 0:
           return jsonify(error="Factorial is not defined for negative numbers"), 400
   
       # AI: Refactor this code...
   
       result = 1
       for i in range(1, n + 1):
           result *= i
   
       # ... into to a compute_factorial() function. AI!
   
       return jsonify(result=result)
   ```

4. **Long Form Instructions**:
   ```python
   # Make these changes: AI!
   # - Add a proper main() function
   # - Use Click to process cmd line args
   # - Accept --host and --port args
   # - Print a welcome message that includes the listening url
   
   if __name__ == "__main__":
       app.run(debug=True)
   ```

### Flexibility

- Works with any file type (not limited to the correct comment syntax for that language)
- Supports multiple comments across different files
- Can be combined with terminal chat for more advanced features
- Comments can be terse and don't need perfect grammar (LLMs can infer intent)

This feature allows you to work directly in your preferred IDE while leveraging Aider's AI capabilities through simple comment markers.

## Running and Testing Shell Commands

Aider provides powerful capabilities for running shell commands, executing tests, and automatically fixing errors that occur during development.

### Linting Capabilities

- **Automatic Linting**: Aider includes built-in linters for most popular programming languages and automatically lints code after making changes
- **Custom Linters**: You can specify your preferred linter using the `--lint-cmd <cmd>` option
- **Per-Language Configuration**: Different linters can be specified for different languages using `--lint "language: cmd"`
- **Disabling Auto-Lint**: Automatic linting can be disabled with the `--no-auto-lint` switch

### Testing Capabilities

- **Test Execution**: Tests can be run manually using `/test <test-command>` or automatically after each AI edit using `--test-cmd <test-command>` combined with `--auto-test`
- **Error Detection**: Aider expects test commands to output errors to stdout/stderr and return non-zero exit codes for failures
- **Automatic Error Fixing**: When test commands return non-zero exit codes, Aider will attempt to automatically fix the identified errors

### Shell Command Execution

Aider provides two primary commands for executing shell commands:

1. **`/run <command>`**: 
   - Executes a shell command once
   - Shows the output directly in the chat
   - Useful for running build commands, installing dependencies, or checking system information
   - Does not automatically trigger error fixing unless combined with other options

2. **`/test <command>`**:
   - Executes a test command and monitors for errors
   - Specifically designed for running test suites
   - When the command returns a non-zero exit code, Aider will attempt to automatically fix the errors
   - Integrates with Aider's auto-fix capabilities

**Key Differences**:
- `/run` is for general command execution and observation
- `/test` is specifically for testing with automatic error correction capabilities
- Both commands show output in the chat, but `/test` has special handling for error scenarios

### Examples

1. **Running Tests Automatically**:
   ```bash
   aider --test-cmd "python -m pytest tests/" --auto-test
   ```

2. **Using Custom Linters**:
   ```bash
   aider --lint-cmd "eslint src/"
   ```

3. **Running Shell Commands**:
   ```
   user: /run npm install
   ```

4. **Running Tests Manually**:
   ```
   user: /test python -m pytest tests/unit/
   ```

5. **Combined Linting and Testing**:
   ```bash
   aider --lint-cmd "flake8 src/" --test-cmd "python -m pytest" --auto-lint --auto-test
   ```

### Compiled Language Support

For compiled languages, you can configure:
- **File-level compilation**: Using `--lint-cmd` to lint and compile individual modified files
- **Project-level building**: Using `--test-cmd` to rebuild and test entire projects (e.g., `--test-cmd "dotnet build && dotnet test"`)

These features work together to create a continuous integration-like experience where code is automatically checked for issues after every AI-assisted edit, with Aider attempting to fix any problems it discovers.

## Git Integration

Aider is tightly integrated with Git and works best with code that's part of a Git repository. This integration provides powerful version control features that make it easy to manage, review, and undo AI-generated changes.

### Core Git Features

- **Automatic Git Repository Creation**: Aider will ask to create a Git repository if launched in a directory without one
- **Automatic Commits**: Whenever Aider edits a file, it automatically commits those changes with descriptive commit messages
- **Dirty File Handling**: Before editing files that already have uncommitted changes, Aider first commits those preexisting changes with descriptive commit messages to keep your edits separate from Aider's changes

### Git Commands

Aider provides several in-chat commands for Git operations:

- **`/diff`**: Shows all file changes since the last message
- **`/undo`**: Undoes and discards the last change
- **`/commit`**: Commits all dirty changes with a sensible commit message
- **`/git <command>`**: Allows running raw Git commands for complex history management

### Examples

1. **Viewing Changes**:
   ```
   user: /diff
   ```

2. **Undoing the Last Change**:
   ```
   user: /undo
   ```

3. **Committing Changes**:
   ```
   user: /commit
   ```

4. **Running Git Commands**:
   ```
   user: /git log --oneline -10
   user: /git status
   user: /git branch
   ```

### Automatic Commit Message Generation

Aider automatically generates commit messages by:
- Sending diffs and chat history to a "weak model"
- Asking it to produce commit messages (following Conventional Commits by default)
- Customizing the commit prompt with the `--commit-prompt` option

Example of automatically generated commit messages:
```
feat: add factorial function to math_utils.py
fix: resolve error handling in sqrt endpoint
refactor: restructure factorial calculation into compute_factorial function
```

### Commit Attribution

Aider marks commits it author or commits:
- Adds "(aider)" to author/committer metadata for authored changes
- Adds "(aider)" to committer metadata for commits of dirty files
- Options available to control attribution behavior (`--no-attribute-author`, `--no-attribute-committer`)
- Can prefix commit messages with "aider: " or add Co-authored-by trailers

### Disabling Git Integration

Git integration can be disabled with flags like:
- `--no-auto-commits`: Stop auto-committing changes
- `--no-dirty-commits`: Stop committing dirty files
- `--no-git`: Completely stop Git usage
- `--git-commit-verify`: Run pre-commit hooks (disabled by default)

This tight Git integration makes Aider an excellent tool for maintaining a clean, traceable history of AI-assisted development work.