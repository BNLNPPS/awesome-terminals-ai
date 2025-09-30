#!/bin/bash

# Copilot Usage Checker Script
# This script checks GitHub Copilot usage information
# Author: Shuwei Ye, yesw@bnl.gov
# Date: 2025-09-29

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

${bold}Requirements:${reset}
- The ${yellow}'copilot'${reset} command must be available
- Valid GitHub authentication (GH_TOKEN/GITHUB_TOKEN env var or copilot config file)

${bold}Authentication priority:${reset}
1. GH_TOKEN environment variable
2. GITHUB_TOKEN environment variable
3. Token from config file (XDG_CONFIG_HOME or ~/.copilot/config.json)
4. MacOS keychain (if on macOS)

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

# Function to suggest login
suggest_login() {
    # Check if colors should be used (respect --no-color option)
    local bold='' green='' yellow='' cyan='' blue='' reset=''
    
    if [[ "$USE_COLOR" == "true" ]]; then
        bold=$(tput bold)
        green=$(tput setaf 2)
        yellow=$(tput bold)$(tput setaf 3)
        cyan=$(tput setaf 6)
        blue=$(tput setaf 4)
        reset=$(tput sgr0)
        
        cat >&2 <<EOF
${blue}🔐 Authentication Required:${reset}
Please run ${cyan}${bold}copilot${reset} and then use ${yellow}${bold}/login${reset} to authenticate with your GitHub account.
${green}💡 Tip:${reset} After running the commands above, try this script again.
EOF
    else
        cat >&2 <<EOF
Authentication Required:
Please run 'copilot' and then use '/login' to authenticate with your GitHub account.
Tip: After running the commands above, try this script again.
EOF
    fi
    return 1
}

# Global variable for color support
USE_COLOR=true

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

${yellow}ℹ️  To install GitHub Copilot CLI, run:${reset}
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

To install GitHub Copilot CLI, run:
  npm install -g @github/copilot

For more information, visit:
  https://github.com/github/copilot-cli
════════════════════════════════════════════════════════════

EOF
    fi
    exit 1
fi

# Function to extract GitHub token
get_github_token() {
    local github_token=""
    
    # Check for GH_TOKEN environment variable first (takes precedence)
    if [[ -n "${GH_TOKEN}" ]]; then
        github_token="${GH_TOKEN}"
        echo "$github_token"
        return 0
    fi
    
    # Check for GITHUB_TOKEN environment variable second
    if [[ -n "${GITHUB_TOKEN}" ]]; then
        github_token="${GITHUB_TOKEN}"
        echo "$github_token"
        return 0
    fi
    
    # Determine config directory - use XDG_CONFIG_HOME if defined, otherwise ~/.copilot
    local config_dir
    if [[ -n "${XDG_CONFIG_HOME}" ]]; then
        config_dir="${XDG_CONFIG_HOME}/copilot"
    else
        config_dir="$HOME/.copilot"
    fi
    
    # Check copilot config file
    local config_file="$config_dir/config.json"
    
    if [[ ! -f "$config_file" ]]; then
        echo "GitHub Copilot config file not found at $config_file" >&2
        suggest_login
        return 1
    fi
    
    # Parse JSON to get last_logged_in_user
    local host login
    if ! host=$(jq -r '.last_logged_in_user.host // empty' "$config_file" 2>/dev/null); then
        error_exit "Failed to parse config file. Please ensure jq is installed."
    fi
    
    if ! login=$(jq -r '.last_logged_in_user.login // empty' "$config_file" 2>/dev/null); then
        error_exit "Failed to parse config file. Please ensure jq is installed."
    fi
    
    if [[ -z "$host" || -z "$login" ]]; then
        echo "No logged in user found in config file." >&2
        suggest_login
        return 1
    fi
    
    # First try to find a user token file (ghu_ format) for better API access
    local token_file="$(dirname "$0")/github_token-${login}"
    if [[ -f "$token_file" ]]; then
        if github_token=$(cat "$token_file" 2>/dev/null); then
            if [[ -n "$github_token" ]]; then
                echo "$github_token"
                return 0
            fi
        fi
    fi
    
    # Try to get token from copilot_tokens in config
    local token_key="${host}:${login}"
    if github_token=$(jq -r ".copilot_tokens[\"$token_key\"] // empty" "$config_file" 2>/dev/null); then
        if [[ -n "$github_token" ]]; then
            echo "$github_token"
            return 0
        fi
    fi
    
    # If copilot_tokens not available and on macOS, try keychain
    if [[ "$(uname)" == "Darwin" ]]; then
        if github_token=$(security find-generic-password -a "${token_key}" -w 2>/dev/null); then
            echo "$github_token"
            return 0
        fi
    fi
    
    # If we get here, no token was found
    echo "No valid token found." >&2
    suggest_login
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

# Function to parse and display usage
parse_usage() {
    local json_data="$1"
    
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
        echo "${bold}${blue}         📊 GitHub Copilot Usage Information${reset}"
        echo "${bold}${blue}════════════════════════════════════════════════════════════${reset}"
    else
        echo "════════════════════════════════════════════════════════════"
        echo "         GitHub Copilot Usage Information"
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
        
        # Chat info section
        if echo "$json_data" | jq -e '.quota_snapshots.chat' >/dev/null 2>&1; then
            echo ""
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
            
            local chat_unlimited
            chat_unlimited=$(echo "$json_data" | jq -r '.quota_snapshots.chat.unlimited // false')
            
            if [[ "$chat_unlimited" == "true" ]]; then
                if [[ "$USE_COLOR" == "true" ]]; then
                    echo "  ${bold}${green}🚀 Chat Requests: ${bold}UNLIMITED${reset}"
                else
                    echo "  Chat Requests: UNLIMITED"
                fi
            else
                local chat_entitlement chat_remaining
                chat_entitlement=$(echo "$json_data" | jq -r '.quota_snapshots.chat.entitlement // 0')
                chat_remaining=$(echo "$json_data" | jq -r '.quota_snapshots.chat.remaining // 0')
                local chat_used=$((chat_entitlement - chat_remaining))
                
                if [[ "$USE_COLOR" == "true" ]]; then
                    local chat_remaining_color="$green"
                    if [[ $chat_remaining -le 100 ]]; then
                        chat_remaining_color="$red"
                    elif [[ $chat_remaining -le 500 ]]; then
                        chat_remaining_color="$yellow"
                    fi
                    
                    echo "  ${bold}Monthly Quota:${reset} $chat_entitlement"
                    echo "  ${bold}Used:${reset}          $chat_used"
                    echo ""
                    echo "  ${bold}${chat_remaining_color}💬 Remaining Chat Requests: ${bold}$chat_remaining${reset}"
                    
                    # Add warning if low
                    if [[ $chat_remaining -le 100 ]]; then
                        echo "  ${bold}${red}⚠️  WARNING: Low chat quota! Only $chat_remaining requests left${reset}"
                    elif [[ $chat_remaining -le 500 ]]; then
                        echo "  ${bold}${yellow}⚠️  NOTICE: $chat_remaining chat requests remaining${reset}"
                    fi
                else
                    echo "  Monthly Quota: $chat_entitlement"
                    echo "  Used:          $chat_used"
                    echo ""
                    echo "  Remaining Chat Requests: $chat_remaining"
                    
                    if [[ $chat_remaining -le 100 ]]; then
                        echo "  WARNING: Low chat quota! Only $chat_remaining requests left"
                    elif [[ $chat_remaining -le 500 ]]; then
                        echo "  NOTICE: $chat_remaining chat requests remaining"
                    fi
                fi
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
    
    # Get usage data
    local usage_data
    if ! usage_data=$(get_copilot_usage "$github_token"); then
        error_exit "Failed to retrieve Copilot usage information."
    fi
    
    # Parse and display usage
    parse_usage "$usage_data"
}

# Run main function
main "$@"