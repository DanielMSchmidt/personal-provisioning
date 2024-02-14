function tmpdir -d "Creates a temporary directory and switches into it"
    cd (mktemp -d)
end
