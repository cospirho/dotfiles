if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting
set -g theme_display_git no
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_sudo_user yes
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date yes
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone America/Chicago
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme terminal2-light
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

function airpods
    set current_output (pactl info | grep 'Default Sink' | awk '{print $3}')
    set airpods_sink (pactl list sinks | grep -i '40_ED_CF_DE_8D_B1' | awk '/Name:/{print $2}')
    set hdmi_sink (pactl list sinks | grep -i 'hdmi-stereo-extra' | awk '/Name:/{print $2}')

    if test $current_output = $hdmi_sink
        echo "Switching to AirPods"
        pactl set-default-sink $airpods_sink
        for stream_id in (pactl list sink-inputs | grep 'Sink Input #' | awk '{print $3}' | tr -d '#')
            pactl move-sink-input $stream_id $airpods_sink
        end
    else if test $current_output = $airpods_sink
        echo "Switching to HDMI"
        pactl set-default-sink $hdmi_sink
        for stream_id in (pactl list sink-inputs | grep 'Sink Input #' | awk '{print $3}' | tr -d '#')
            pactl move-sink-input $stream_id $hdmi_sink
        end
    else
        echo "Unknown default output: $current_output"
    end

end


alias vim='nvim'



