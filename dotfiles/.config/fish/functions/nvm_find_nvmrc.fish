function nvm_find_nvmrc
    if type -q "bass"
        bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm_find_nvmrc
    end
end
