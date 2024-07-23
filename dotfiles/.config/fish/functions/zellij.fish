function set_tab_name -d "Sets the name of the tab to the dir name"
    zellij action rename-tab (basename (pwd))
end

# Set on cd
# function __set_tab_name --on-variable PWD --description 'Set name of the tab to the dir name'
#     status --is-command-substitution; and return
#     set_tab_name
# end
# Set on new tab
set_tab_name
