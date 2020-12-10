
function __complete_kustomize
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /usr/local/bin/kustomize
end
complete -f -c kustomize -a "(__complete_kustomize)"

