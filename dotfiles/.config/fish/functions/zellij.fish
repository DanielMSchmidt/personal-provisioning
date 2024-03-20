function set_tab_name -d "Sets the name of the tab to the dir name"
    zellij action rename-tab (basename (pwd))
end
