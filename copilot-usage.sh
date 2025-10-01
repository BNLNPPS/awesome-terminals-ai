#!/bin/bash

# Copilot Usage Checker Script
# This script checks GitHub Copilot usage information
# Author: Shuwei Ye, yesw@bnl.gov
# Date: 2025-10-01
# Script Version: 20251001-r2

readonly SCRIPT_VERSION="20251001-r2"

# Check if script is being sourced (should be executed directly)
if [[ "${BASH_SOURCE[0]}" != "${0}" ]] || [[ -n "$ZSH_EVAL_CONTEXT" && "$ZSH_EVAL_CONTEXT" =~ :file$ ]]; then
    echo "Warning: This script should be executed directly, not sourced!" >&2
    return 1 2>/dev/null || exit 1
fi

# Function to show usage help
show_help() {
    # Use tput for better portability (always show colors for help visibility)
    local bold=$(tput bold)
    local green=$(tput setaf 2)
    local blue=$(tput setaf 4)
    local cyan=$(tput setaf 6)
    local yellow=$(tput bold)$(tput setaf 3)
    local reset=$(tput sgr0)
    
    cat <<EOF
${bold}Usage:${reset} $(basename "$0") [OPTIONS]

${blue}📊 This script ${bold}${green}checks your GitHub Copilot usage${reset}${blue} information including:${reset}
- Copilot subscription type
- Used/remaining monthly premium requests (for non-free subscriptions)
- Used/remaining monthly chats (for free subscriptions)
- Next reset date

${bold}Options:${reset}
  ${cyan}-h, --help${reset}       Show this help message
  ${cyan}--no-color${reset}       Disable colors and emojis for plain text output
  ${cyan}--verbose${reset}        Enable verbose output for debugging
  ${cyan}--version${reset}        Show script version

${bold}Requirements:${reset}
- The ${yellow}'copilot'${reset} command must be available
- Valid GitHub authentication token (starting with 'ghu_')

${bold}Authentication priority:${reset}
1. GH_TOKEN environment variable (must start with 'ghu_')
2. GITHUB_TOKEN environment variable (must start with 'ghu_')
3. Token from ~/.copilot/gh_token.json
4. OAuth device flow (interactive authentication)

EOF
}

# Function to exit with error message
error_exit() {
    # Use tput for better portability (respect --no-color option if set)
    local red='' bold='' reset=''
    
    if [[ "$USE_COLOR" == "true" ]]; then
        red=$(tput setaf 1)
        bold=$(tput bold)
        reset=$(tput sgr0)
        
        cat >&2 <<EOF

${red}${bold}════════════════════════════════════════════════════════════${reset}
${red}${bold}  ❌ ERROR${reset}
${red}${bold}════════════════════════════════════════════════════════════${reset}
${red}$1${reset}
${red}${bold}════════════════════════════════════════════════════════════${reset}

EOF
    else
        cat >&2 <<EOF

════════════════════════════════════════════════════════════
  ERROR
════════════════════════════════════════════════════════════
$1
════════════════════════════════════════════════════════════

EOF
    fi
    exit 1
}

# Function to print version information
print_version() {
    # Use tput for better portability (respect --no-color option if set)
    local bold='' blue='' reset=''
    
    if [[ "$USE_COLOR" == "true" ]]; then
        bold=$(tput bold)
        blue=$(tput setaf 4)
        reset=$(tput sgr0)
        
        echo "${bold}${blue}📦 Script Version:${reset} $SCRIPT_VERSION"
    else
        echo "Script Version: $SCRIPT_VERSION"
    fi
    exit 0
}

# Global variable for color support
USE_COLOR=true
VERBOSE=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        --no-color)
            USE_COLOR=false
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        --version)
            print_version
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            echo "Use -h or --help for usage information." >&2
            exit 1
            ;;
    esac
done

# Check if copilot command is available
if ! command -v copilot >/dev/null 2>&1; then
    # Use tput for better portability (respect --no-color option if set)
    red='' bold='' yellow='' cyan='' reset=''
    
    if [[ "$USE_COLOR" == "true" ]]; then
        red=$(tput setaf 1)
        bold=$(tput bold)
        yellow=$(tput bold)$(tput setaf 3)
        cyan=$(tput setaf 6)
        reset=$(tput sgr0)
        
        cat >&2 <<EOF

${red}${bold}════════════════════════════════════════════════════════════${reset}
${red}${bold}  ❌ ERROR${reset}
${red}${bold}════════════════════════════════════════════════════════════${reset}
${red}The 'copilot' command is not found.${reset}

${yellow}ℹ️  To install GitHub Copilot CLI:${reset}

${yellow}If 'nvm' is not available, first install it:${reset}
  ${cyan}${bold}curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash${reset}
  ${cyan}${bold}nvm install node${reset}

${yellow}Then install GitHub Copilot CLI:${reset}
  ${cyan}${bold}npm install -g @github/copilot${reset}

For more information, visit:
  ${cyan}https://github.com/github/copilot-cli${reset}
${red}${bold}════════════════════════════════════════════════════════════${reset}

EOF
    else
        cat >&2 <<EOF

════════════════════════════════════════════════════════════
  ERROR
════════════════════════════════════════════════════════════
The 'copilot' command is not found.

To install GitHub Copilot CLI:

If 'nvm' is not available, first install it:
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  nvm install node

Then install GitHub Copilot CLI:
  npm install -g @github/copilot

For more information, visit:
  https://github.com/github/copilot-cli
════════════════════════════════════════════════════════════

EOF
    fi
    exit 1
fi

# Function to validate GitHub token
validate_github_token() {
    local token="$1"
    
    if [[ -z "$token" ]]; then
        return 1
    fi
    
    # Valid token starts with "ghu_"
    if [[ "$token" == ghu_* ]]; then
        return 0
    else
        return 1
    fi
}

# Function to print verbose message
verbose_log() {
    if [[ "$VERBOSE" == "true" ]]; then
        echo "[VERBOSE] $*" >&2
    fi
}

# Function to extract GitHub token
get_github_token() {
    local github_token=""
    
    verbose_log "Starting token retrieval process..."
    
    # Check for GH_TOKEN environment variable first
    if [[ -n "${GH_TOKEN}" ]]; then
        verbose_log "Found GH_TOKEN environment variable"
        if validate_github_token "${GH_TOKEN}"; then
            verbose_log "GH_TOKEN is valid (starts with ghu_): ${GH_TOKEN}"
            github_token="${GH_TOKEN}"
            echo "$github_token"
            return 0
        else
            verbose_log "GH_TOKEN is invalid (does not start with ghu_): ${GH_TOKEN}"
        fi
    else
        verbose_log "GH_TOKEN environment variable not set"
    fi
    
    # Check for GITHUB_TOKEN environment variable second
    if [[ -n "${GITHUB_TOKEN}" ]]; then
        verbose_log "Found GITHUB_TOKEN environment variable"
        if validate_github_token "${GITHUB_TOKEN}"; then
            verbose_log "GITHUB_TOKEN is valid (starts with ghu_): ${GITHUB_TOKEN}"
            github_token="${GITHUB_TOKEN}"
            echo "$github_token"
            return 0
        else
            verbose_log "GITHUB_TOKEN is invalid (does not start with ghu_): ${GITHUB_TOKEN}"
        fi
    else
        verbose_log "GITHUB_TOKEN environment variable not set"
    fi
    
    # Try to get token from gh_token.json file
    local token_file="$HOME/.copilot/gh_token.json"
    verbose_log "Checking for token file: $token_file"
    
    if [[ -f "$token_file" ]]; then
        verbose_log "Token file exists, attempting to read..."
        
        # Ensure secure permissions on token file
        chmod 0600 "$token_file" 2>/dev/null || true
        
        # Try to parse the JSON file
        local token_value
        if token_value=$(jq -r '.github_token | to_entries[0].value // empty' "$token_file" 2>/dev/null); then
            if [[ -n "$token_value" ]]; then
                verbose_log "Found token in gh_token.json"
                if validate_github_token "$token_value"; then
                    verbose_log "Token from gh_token.json is valid (starts with ghu_)"
                    github_token="$token_value"
                    echo "$github_token"
                    return 0
                else
                    verbose_log "Token from gh_token.json is invalid (does not start with ghu_)"
                fi
            else
                verbose_log "Token file exists but is empty or malformed"
            fi
        else
            verbose_log "Failed to parse token file"
        fi
    else
        verbose_log "Token file does not exist: $token_file"
    fi
    
    # If no valid token found, use OAuth flow to get one
    verbose_log "No valid token found, initiating OAuth flow..."
    if github_token=$(get_github_oauth_token); then
        verbose_log "Successfully obtained token via OAuth"
        
        # Validate the newly obtained token
        if validate_github_token "$github_token"; then
            verbose_log "OAuth token is valid (starts with ghu_)"
            echo "$github_token"
            return 0
        else
            verbose_log "OAuth token is invalid (does not start with ghu_)"
            error_exit "Obtained token is invalid. A valid GitHub token must start with 'ghu_'."
        fi
    else
        verbose_log "OAuth flow failed"
        error_exit "Failed to obtain a valid GitHub token. Please try again or set GH_TOKEN/GITHUB_TOKEN environment variable with a valid token (starting with 'ghu_')."
    fi
}

# Function to get GitHub OAuth token using device flow
get_github_oauth_token() {
    local client_id="Iv1.b507a08c87ecfe98"
    local device_code user_code verification_uri expires_in interval
    local access_token
    
    # Use tput for better portability (respect --no-color option if set)
    local info='' bold='' cyan='' yellow='' reset=''
    
    if [[ "$USE_COLOR" == "true" ]]; then
        info=$(tput setaf 3)  # Yellow for info
        bold=$(tput bold)
        cyan=$(tput setaf 6)
        yellow=$(tput bold)$(tput setaf 3)
        reset=$(tput sgr0)
    fi
    
    # Step 1: Get device code
    echo "${info}ℹ Not logged in, getting new access token${reset}" >&2
    
    local device_response
    if ! device_response=$(curl -s -X POST "https://github.com/login/device/code" \
        -H "Accept: application/json" \
        -d "client_id=${client_id}" \
        -d "scope=read:user" 2>/dev/null); then
        echo "${red}Error: Failed to get device code from GitHub${reset}" >&2
        return 1
    fi
    
    # Parse device response
    if ! device_code=$(echo "$device_response" | jq -r '.device_code // empty' 2>/dev/null) || [[ -z "$device_code" ]]; then
        echo "${red}Error: Failed to parse device code from response${reset}" >&2
        echo "Response: $device_response" >&2
        return 1
    fi
    
    if ! user_code=$(echo "$device_response" | jq -r '.user_code // empty' 2>/dev/null) || [[ -z "$user_code" ]]; then
        echo "${red}Error: Failed to parse user code from response${reset}" >&2
        return 1
    fi
    
    if ! verification_uri=$(echo "$device_response" | jq -r '.verification_uri // empty' 2>/dev/null) || [[ -z "$verification_uri" ]]; then
        echo "${red}Error: Failed to parse verification URI from response${reset}" >&2
        return 1
    fi
    
    expires_in=$(echo "$device_response" | jq -r '.expires_in // 900' 2>/dev/null)
    interval=$(echo "$device_response" | jq -r '.interval // 5' 2>/dev/null)
    
    # Display authentication instructions
    echo "${info}ℹ Please enter the code \"${bold}${user_code}${reset}${info}\" in ${cyan}${verification_uri}${reset}" >&2
    
    # Step 2: Poll for access token
    local start_time=$(date +%s)
    local end_time=$((start_time + expires_in))
    
    while [[ $(date +%s) -lt $end_time ]]; do
        local token_response
        if token_response=$(curl -s -X POST "https://github.com/login/oauth/access_token" \
            -H "Accept: application/json" \
            -d "client_id=${client_id}" \
            -d "device_code=${device_code}" \
            -d "grant_type=urn:ietf:params:oauth:grant-type:device_code" 2>/dev/null); then
            
            # Check for access token in response
            if access_token=$(echo "$token_response" | jq -r '.access_token // empty' 2>/dev/null) && [[ -n "$access_token" ]]; then
                # Get user login from GitHub API
                local user_response login
                if user_response=$(curl -s -H "Authorization: token $access_token" \
                    -H "Content-Type: application/json" \
                    -H "Accept: application/json" \
                    "https://api.github.com/user" 2>/dev/null); then
                    
                    if login=$(echo "$user_response" | jq -r '.login // empty' 2>/dev/null) && [[ -n "$login" ]]; then
                        # Create config directory if it doesn't exist
                        local config_dir="$HOME/.copilot"
                        mkdir -p "$config_dir"
                        
                        # Write token to file in the specified format
                        local token_file="$config_dir/gh_token.json"
                        cat > "$token_file" <<EOF
{
  "github_token": {
    "https://github.com:${login}": "${access_token}"
  }
}
EOF
                        # Set secure permissions (read/write for owner only)
                        chmod 0600 "$token_file"
                        echo "${info}ℹ Token saved to ${token_file}${reset}" >&2
                    fi
                fi
                
                echo "$access_token"
                return 0
            fi
            
            # Check for error
            local error
            if error=$(echo "$token_response" | jq -r '.error // empty' 2>/dev/null); then
                case "$error" in
                    "authorization_pending")
                        # User hasn't authorized yet, continue polling
                        ;;
                    "slow_down")
                        # GitHub asks us to slow down, double the interval
                        interval=$((interval * 2))
                        ;;
                    "expired_token"|"access_denied"|"invalid_request")
                        echo "${red}Error: $error - ${token_response}${reset}" >&2
                        return 1
                        ;;
                    *)
                        echo "${red}Unknown error: $error${reset}" >&2
                        return 1
                        ;;
                esac
            fi
        fi
        
        # Wait before next poll
        sleep "$interval"
    done
    
    echo "${red}Error: Authentication timed out${reset}" >&2
    return 1
}



# Function to make API call
get_copilot_usage() {
    local github_token="$1"
    local base_headers=(
        "-H" "Authorization: Bearer ${github_token}"
        "-H" "Content-Type: application/json"
    )
    
    if ! curl -sSf --connect-timeout 10 --max-time 30 "${base_headers[@]}" \
         "https://api.github.com/copilot_internal/user"; then
        error_exit "Failed to retrieve Copilot usage information. Please check your token and network connection."
    fi
}

# Function to get GitHub username
get_github_username() {
    local github_token="$1"
    local base_headers=(
        "-H" "Authorization: Bearer ${github_token}"
        "-H" "Content-Type: application/json"
    )
    
    local user_info
    if user_info=$(curl -sSf --connect-timeout 10 --max-time 30 "${base_headers[@]}" \
         "https://api.github.com/user" 2>/dev/null); then
        echo "$user_info" | jq -r '.login // "unknown"'
    else
        echo "unknown"
    fi
}

# Function to parse and display usage
parse_usage() {
    local json_data="$1"
    local github_login="$2"
    
    # Use tput for better portability (only if colors are enabled)
    local bold='' green='' yellow='' blue='' cyan='' red='' magenta='' reset=''
    
    if [[ "$USE_COLOR" == "true" ]]; then
        bold=$(tput bold)
        green=$(tput setaf 2)
        yellow=$(tput bold)$(tput setaf 3)
        blue=$(tput setaf 4)
        cyan=$(tput setaf 6)
        red=$(tput setaf 1)
        magenta=$(tput setaf 5)
        reset=$(tput sgr0)
    fi
    
    # Extract basic info
    local access_type reset_date
    access_type=$(echo "$json_data" | jq -r '.access_type_sku // "unknown"')
    
    # Print header with border
    echo ""
    if [[ "$USE_COLOR" == "true" ]]; then
        echo "${bold}${blue}════════════════════════════════════════════════════════════${reset}"
        echo "${bold}${blue}  📊 GitHub Copilot Usage Information for ${github_login}${reset}"
        echo "${bold}${blue}════════════════════════════════════════════════════════════${reset}"
    else
        echo "════════════════════════════════════════════════════════════"
        echo "  GitHub Copilot Usage Information for ${github_login}"
        echo "════════════════════════════════════════════════════════════"
    fi
    echo ""
    
    # Check if this is a free subscription
    if echo "$json_data" | jq -e '.limited_user_quotas' >/dev/null 2>&1; then
        # FREE SUBSCRIPTION
        reset_date=$(echo "$json_data" | jq -r '.limited_user_reset_date // "unknown"')
        
        # Display reset date at the top
        if [[ "$USE_COLOR" == "true" ]]; then
            echo "${bold}📅 Next Reset Date: ${yellow}$reset_date${reset}"
        else
            echo "Next Reset Date: $reset_date"
        fi
        echo ""
        
        # Subscription type
        if [[ "$USE_COLOR" == "true" ]]; then
            echo "${bold}📋 Subscription: ${cyan}$access_type${reset} ${green}🆓${reset}"
        else
            echo "Subscription: $access_type (Free)"
        fi
        echo ""
        
        local monthly_chat_quota monthly_chat_used remaining_chats remaining_requests
        monthly_chat_quota=$(echo "$json_data" | jq -r '.monthly_quotas.chat // 0')
        local limited_chat_quota
        limited_chat_quota=$(echo "$json_data" | jq -r '.limited_user_quotas.chat // 0')
        monthly_chat_used=$((monthly_chat_quota - limited_chat_quota))
        remaining_chats=$limited_chat_quota
        remaining_requests=$((remaining_chats / 10))
        
        # Display usage with visual emphasis
        if [[ "$USE_COLOR" == "true" ]]; then
            echo "${bold}${magenta}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
            echo "${bold}${cyan}  💬 Chat Requests${reset}"
            echo "${bold}${magenta}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
        else
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "  Chat Requests"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        fi
        echo ""
        
        if [[ "$USE_COLOR" == "true" ]]; then
            echo "  ${bold}Monthly Quota:${reset} $monthly_chat_quota"
            echo "  ${bold}Used:${reset}          $monthly_chat_used"
            echo ""
            echo "  ${bold}${green}💬 Remaining Chat Requests: ${bold}${remaining_chats}${reset}"
            echo "  ${cyan}   (≈ ${bold}$remaining_requests${reset}${cyan} Copilot requests @ 10 chats each)${reset}"
        else
            echo "  Monthly Quota: $monthly_chat_quota"
            echo "  Used:          $monthly_chat_used"
            echo ""
            echo "  Remaining Chat Requests: $remaining_chats"
            echo "   (≈ $remaining_requests Copilot requests @ 10 chats each)"
        fi
        
    else
        # PREMIUM SUBSCRIPTION
        reset_date=$(echo "$json_data" | jq -r '.quota_reset_date // .quota_reset_date_utc // "unknown"')
        
        # Display reset date at the top
        if [[ "$USE_COLOR" == "true" ]]; then
            echo "${bold}📅 Next Reset Date: ${yellow}$reset_date${reset}"
        else
            echo "Next Reset Date: $reset_date"
        fi
        echo ""
        
        # Subscription type
        if [[ "$USE_COLOR" == "true" ]]; then
            echo "${bold}📋 Subscription: ${cyan}$access_type${reset} ${magenta}💎${reset}"
        else
            echo "Subscription: $access_type (Premium)"
        fi
        echo ""
        
        # Premium interactions section
        if echo "$json_data" | jq -e '.quota_snapshots.premium_interactions' >/dev/null 2>&1; then
            local entitlement remaining unlimited
            entitlement=$(echo "$json_data" | jq -r '.quota_snapshots.premium_interactions.entitlement // 0')
            remaining=$(echo "$json_data" | jq -r '.quota_snapshots.premium_interactions.remaining // 0')
            unlimited=$(echo "$json_data" | jq -r '.quota_snapshots.premium_interactions.unlimited // false')
            
            local used=$((entitlement - remaining))
            
            if [[ "$USE_COLOR" == "true" ]]; then
                echo "${bold}${magenta}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
                echo "${bold}${cyan}  ⚡ Premium Interactions${reset}"
                echo "${bold}${magenta}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
            else
                echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
                echo "  Premium Interactions"
                echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            fi
            echo ""
            
            if [[ "$unlimited" == "true" ]]; then
                if [[ "$USE_COLOR" == "true" ]]; then
                    echo "  ${bold}${green}🚀 Status: ${bold}UNLIMITED${reset}"
                else
                    echo "  Status: UNLIMITED"
                fi
            else
                if [[ "$USE_COLOR" == "true" ]]; then
                    local remaining_color="$green"
                    if [[ $remaining -le 10 ]]; then
                        remaining_color="$red"
                    elif [[ $remaining -le 50 ]]; then
                        remaining_color="$yellow"
                    fi
                    
                    echo "  ${bold}Monthly Quota:${reset} $entitlement"
                    echo "  ${bold}Used:${reset}          $used"
                    echo ""
                    echo "  ${bold}${remaining_color}⚡ Remaining Premium Requests: ${bold}$remaining${reset}"
                    
                    # Add warning if low
                    if [[ $remaining -le 10 ]]; then
                        echo "  ${bold}${red}⚠️  WARNING: Low quota! Only $remaining requests left${reset}"
                    elif [[ $remaining -le 50 ]]; then
                        echo "  ${bold}${yellow}⚠️  NOTICE: $remaining requests remaining${reset}"
                    fi
                else
                    echo "  Monthly Quota: $entitlement"
                    echo "  Used:          $used"
                    echo ""
                    echo "  Remaining Premium Requests: $remaining"
                    
                    if [[ $remaining -le 10 ]]; then
                        echo "  WARNING: Low quota! Only $remaining requests left"
                    elif [[ $remaining -le 50 ]]; then
                        echo "  NOTICE: $remaining requests remaining"
                    fi
                fi
            fi
        else
            if [[ "$USE_COLOR" == "true" ]]; then
                echo "${yellow}⚠️  Premium interaction data not available.${reset}"
            else
                echo "Premium interaction data not available."
            fi
        fi
    fi
    
    # Footer
    echo ""
    if [[ "$USE_COLOR" == "true" ]]; then
        echo "${bold}${blue}════════════════════════════════════════════════════════════${reset}"
    else
        echo "════════════════════════════════════════════════════════════"
    fi
    echo ""
}

# Main execution
main() {
    # Check for jq dependency
    if ! command -v jq >/dev/null 2>&1; then
        error_exit "The 'jq' command is required for JSON parsing. Please install jq."
    fi
    
    echo "Retrieving GitHub Copilot usage information..."
    echo
    
    # Get GitHub token
    local github_token
    if ! github_token=$(get_github_token); then
        exit 1
    fi
    
    # Get GitHub username
    local github_login
    github_login=$(get_github_username "$github_token")
    
    # Get usage data
    local usage_data
    if ! usage_data=$(get_copilot_usage "$github_token"); then
        error_exit "Failed to retrieve Copilot usage information."
    fi
    
    # Parse and display usage
    parse_usage "$usage_data" "$github_login"
}

# Run main function
main "$@"