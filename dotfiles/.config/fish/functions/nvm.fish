function nvm
    if type -q "bass"
        bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
    end
end
