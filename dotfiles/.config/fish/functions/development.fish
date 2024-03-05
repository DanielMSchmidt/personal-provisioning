function tmpdir -d "Creates a temporary directory and switches into it"
    cd (mktemp -d)
end

function jira -d "Opens jira for this branch"
    open "https://hashicorp.atlassian.net/browse/$(git branch --show-current)"
end
