# ┌────────────────────────────────┐
# │░░░█▀█░█▀▄░█▀█░█▄█░█▀█░▀█▀░█░░░░│
# │░░░█▀▀░█▀▄░█░█░█░█░█▀▀░░█░░▀░░░░│
# │░░░▀░░░▀░▀░▀▀▀░▀░▀░▀░░░░▀░░▀░░░░│
# └────────────────────────────────┘
# This shell prompt config file was created by promptline.vim
# Then heavily modified to personal preferance and sort some minor bugs
# https://github.com/edkolev/promptline.vim

# -- configure promptline ---
# https://github.com/edkolev/promptline.vim/issues/10
vim_ins_mode="INSERT"
vim_cmd_mode="NORMAL"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  __promptline
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

function __promptline_host {
  local only_if_ssh="0"

  if [ ! $only_if_ssh -o -n "${SSH_CLIENT}" ]; then
    print %m
  fi

  #if [ ! $only_if_ssh -o -n "${SSH_CLIENT}" ]; then
    #if [[ -n ${ZSH_VERSION-} ]]; then print %m; elif [[ -n ${FISH_VERSION-} ]]; then hostname -s; else printf "%s" \\h; fi
  #fi
}

function __promptline_last_exit_code {

  [[ $last_exit_code -gt 0 ]] || return 1;

  printf "%s" "$last_exit_code"
}
function __promptline_vcs_branch {
  local branch
  local branch_symbol=" "

  # git
  if hash git 2>/dev/null; then
    if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null ); then
      branch=${branch##*/}
      printf "%s" "${branch_symbol}${branch:-unknown}"
      return
    fi
  fi
  return 1
}
function __promptline_cwd {
  local dir_limit="3"
  #local truncation="⋯"
  local truncation="..."
  local first_char
  local part_count=0
  local formatted_cwd=""
  #local dir_sep="  "
  local dir_sep="/"
  local tilde="~"

  local cwd="${PWD/#$HOME/$tilde}"

  # get first char of the path, i.e. tilde or slash
  [[ -n ${ZSH_VERSION-} ]] && first_char=$cwd[1,1] || first_char=${cwd::1}

  # remove leading tilde
  cwd="${cwd#\~}"

  while [[ "$cwd" == */* && "$cwd" != "/" ]]; do
    # pop off last part of cwd
    local part="${cwd##*/}"
    cwd="${cwd%/*}"

    formatted_cwd="$dir_sep$part$formatted_cwd"
    part_count=$((part_count+1))

    [[ $part_count -eq $dir_limit ]] && first_char="$truncation" && break
  done

  # if dir_sep is a '/' remove leading slash when root is visble
  if [[ $first_char = $dir_sep && $cwd != "/" ]]; then
    printf "%s" "$formatted_cwd"
  else
    printf "%s" "$first_char$formatted_cwd"
  fi
}

function __promptline_left_prompt {
  local slice_prefix slice_empty_prefix slice_joiner slice_suffix is_prompt_empty=1

  # section vi mode header
  if [[ "$vim_mode" == "$vim_cmd_mode" ]]; then
    slice_prefix="${vi_cmd_bg}${vi_cmd_fg}${vi_cmd_bg}${space}" slice_suffix="$space${vi_cmd_sep_fg}" slice_joiner="${vi_cmd_fg}${vi_cmd_bg}${alt_sep}${space}" slice_empty_prefix="${vi_cmd_fg}${vi_cmd_bg}${space}"
  else
    slice_prefix="${vi_bg}${vi_fg}${vi_bg}${space}" slice_suffix="$space${vi_sep_fg}" slice_joiner="${vi_fg}${vi_bg}${alt_sep}${space}" slice_empty_prefix="${vi_fg}${vi_bg}${space}"
  fi

  # section vi mode slices
  __promptline_wrapper "$vim_mode" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section jobs header
  slice_prefix="${jobs_bg}${sep}${jobs_fg}${jobs_bg}${space}" slice_suffix="$space${jobs_sep_fg}" slice_joiner="${jobs_fg}${jobs_bg}${alt_sep}${space}" slice_empty_prefix="${jobs_fg}${jobs_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"

  # section jobs slices
  __promptline_wrapper "$(__promptline_jobs)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section cwd  header
  slice_prefix="${cwd_bg}${sep}${cwd_fg}${cwd_bg}${space}" slice_suffix="$space${cmd_sep_fg}" slice_joiner="${cwd_fg}${cwd_bg}${alt_sep}${space}" slice_empty_prefix="${cwd_fg}${cwd_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"

  # section cwd  slices
  __promptline_wrapper "$(__promptline_cwd)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # close sections
  printf "%s" "${reset_bg}${sep}$reset$space"
}
function __promptline_wrapper {
  # wrap the text in $1 with $2 and $3, only if $1 is not empty
  # $2 and $3 typically contain non-content-text, like color escape codes and separators

  [[ -n "$1" ]] || return 1
  printf "%s" "${2}${1}${3}"
}
function __promptline_git_status {
  [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]] || return 1

  local added_symbol="●"
  local unmerged_symbol="✗"
  local modified_symbol="+"
  local clean_symbol="✔"
  local has_untracked_files_symbol="…"

  local ahead_symbol="↑"
  local behind_symbol="↓"

  local unmerged_count=0 modified_count=0 has_untracked_files=0 added_count=0 is_clean=""

  set -- $(git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null)
  local behind_count=$1
  local ahead_count=$2

  # Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R), changed (T), Unmerged (U), Unknown (X), Broken (B)
  while read line; do
    case "$line" in
      M*) modified_count=$(( $modified_count + 1 )) ;;
      U*) unmerged_count=$(( $unmerged_count + 1 )) ;;
    esac
  done < <(git diff --name-status)

  while read line; do
    case "$line" in
      *) added_count=$(( $added_count + 1 )) ;;
    esac
  done < <(git diff --name-status --cached)

  if [ -n "$(git ls-files --others --exclude-standard)" ]; then
    has_untracked_files=1
  fi

  if [ $(( unmerged_count + modified_count + has_untracked_files + added_count )) -eq 0 ]; then
    is_clean=1
  fi

  local leading_whitespace=""
  [[ $ahead_count -gt 0 ]]         && { printf "%s" "$leading_whitespace$ahead_symbol$ahead_count"; leading_whitespace=" "; }
  [[ $behind_count -gt 0 ]]        && { printf "%s" "$leading_whitespace$behind_symbol$behind_count"; leading_whitespace=" "; }
  [[ $modified_count -gt 0 ]]      && { printf "%s" "$leading_whitespace$modified_symbol$modified_count"; leading_whitespace=" "; }
  [[ $unmerged_count -gt 0 ]]      && { printf "%s" "$leading_whitespace$unmerged_symbol$unmerged_count"; leading_whitespace=" "; }
  [[ $added_count -gt 0 ]]         && { printf "%s" "$leading_whitespace$added_symbol$added_count"; leading_whitespace=" "; }
  [[ $has_untracked_files -gt 0 ]] && { printf "%s" "$leading_whitespace$has_untracked_files_symbol"; leading_whitespace=" "; }
  [[ $is_clean -gt 0 ]]            && { printf "%s" "$leading_whitespace$clean_symbol"; leading_whitespace=" "; }
}

## Right side prompt composition
function __promptline_right_prompt {
  local slice_prefix slice_empty_prefix slice_joiner slice_suffix

  # section "warn" header
  slice_prefix="${warn_sep_fg}${rsep}${warn_fg}${warn_bg}${space}" slice_suffix="$space${warn_sep_fg}" slice_joiner="${warn_fg}${warn_bg}${alt_rsep}${space}" slice_empty_prefix=""
  # section "warn" slices
  __promptline_wrapper "$(__promptline_last_exit_code)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  # section "x" header
  slice_prefix="${x_sep_fg}${rsep}${x_fg}${x_bg}${space}" slice_suffix="$space${x_sep_fg}" slice_joiner="${x_fg}${x_bg}${alt_rsep}${space}" slice_empty_prefix=""
  # section "x" slices
  __promptline_wrapper "$(__promptline_vcs_branch)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }
  __promptline_wrapper "$(__promptline_git_status)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  # section "y" header
  slice_prefix="${y_sep_fg}${rsep}${y_fg}${y_bg}${space}" slice_suffix="$space${y_sep_fg}" slice_joiner="${y_fg}${y_bg}${alt_rsep}${space}" slice_empty_prefix=""
  # section "y" slices
  __promptline_wrapper "$(__promptline_host)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  ## section "z" header
  # jobs
  slice_prefix="${z_sep_fg}${rsep}${z_fg}${z_bg}${space}" slice_suffix="$space${z_sep_fg}" slice_joiner="${z_fg}${z_bg}${alt_rsep}${space}" slice_empty_prefix=""

  ## section "z" slices
  # time
   __promptline_wrapper "$(date +%H:%M:%S)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  # close sections
  printf "%s" "$reset"
}

# jobs function, print job count if any
function __promptline_jobs {
  local job_count=0

  local IFS=$'\n'
  for job in $(jobs); do
    # count only lines starting with [
    if [[ $job == \[* ]]; then
      job_count=$(($job_count+1))
    fi
  done

  [[ $job_count -gt 0 ]] || return 1;
  printf "%s" "$job_count"
}

# compose prompt, define glyphs and colors
function __promptline {
  local last_exit_code="${PROMPTLINE_LAST_EXIT_CODE:-$?}"

  local esc=$'[' end_esc=m
  local noprint='%{' end_noprint='%}'
  local wrap="$noprint$esc" end_wrap="$end_esc$end_noprint"
  local space=" "
  local sep=""
  local rsep=""
  local alt_sep=""
  local alt_rsep=""
  local reset="${wrap}0${end_wrap}"
  local reset_bg="${wrap}49${end_wrap}"

  local vi_fg="${wrap}38;5;235${end_wrap}"
  local vi_bg="${wrap}48;5;4${end_wrap}"
  local vi_sep_fg="${wrap}38;5;4${end_wrap}"

  local vi_cmd_fg="${wrap}38;5;235${end_wrap}"
  local vi_cmd_bg="${wrap}48;5;5${end_wrap}"
  local vi_cmd_sep_fg="${wrap}38;5;5${end_wrap}"

  local cwd_fg="${wrap}38;5;246${end_wrap}"
  local cwd_bg="${wrap}48;5;239${end_wrap}"
  local cmd_sep_fg="${wrap}38;5;239${end_wrap}"

  local jobs_fg="${wrap}38;5;0${end_wrap}"
  local jobs_bg="${wrap}48;5;6${end_wrap}"
  local jobs_sep_fg="${wrap}38;5;6${end_wrap}"

  local warn_fg="${wrap}38;5;235${end_wrap}"
  local warn_bg="${wrap}48;5;9${end_wrap}"
  local warn_sep_fg="${wrap}38;5;9${end_wrap}"

  local x_fg="${wrap}38;5;223${end_wrap}"
  local x_bg="${wrap}48;5;239${end_wrap}"
  local x_sep_fg="${wrap}38;5;239${end_wrap}"

  local y_fg="${wrap}38;5;246${end_wrap}"
  local y_bg="${wrap}48;5;239${end_wrap}"
  local y_sep_fg="${wrap}38;5;239${end_wrap}"

  local z_fg="${wrap}38;5;235${end_wrap}"
  local z_bg="${wrap}48;5;246${end_wrap}"
  local z_sep_fg="${wrap}38;5;246${end_wrap}"

  PROMPT="$(__promptline_left_prompt)"
  RPROMPT="$(__promptline_right_prompt)"
}

precmd_functions+=(__promptline)
