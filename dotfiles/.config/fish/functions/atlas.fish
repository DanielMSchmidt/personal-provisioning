set -x ATLAS_PATH /Users/dschmidt/work/hashicorp/atlas
set -x AGENT_PATH /Users/dschmidt/work/hashicorp/tfc-agent
set -x TERRAFORM_CREDENTIALS_FILE /Users/dschmidt/.terraform.d/credentials.tfrc.json

function atlas_hostname -d "Outputs the atlas host name"
    echo (cd "$ATLAS_PATH" && eval "$(tfcdev stack env --export 2> /dev/null)"  && echo "$TFE_FQDN")
end

function atlas_token -d "Get auth token to authenticate against atlas"
    set HOSTNAME (atlas_hostname)
    # Read the token from the file
    set TOKEN (jq -r ".credentials[\"$HOSTNAME\"].token" < "$TERRAFORM_CREDENTIALS_FILE")

    if test -z $TOKEN
        echo "ERROR: Token for '$HOSTNAME' is empty. Running 'terraform login $HOSTNAME' to set the token."

        # Let's log in
        terraform login $HOSTNAME

        # Alright now we are set
        echo (atlas_token)
    end

    echo $TOKEN
end

function agent_token -d "Gets agent token from atlas"
    set TOKEN (atlas_token)
    set HOST (atlas_hostname)

    set AGENT_POOL_ID (curl \
            --header "Authorization: Bearer $TOKEN" \
            --header "Content-Type: application/vnd.api+json" \
            --request GET \
            https://$HOST/api/v2/organizations/hashicorp/agent-pools  2> /dev/null \
        | jq -r '.data[0].id')

    echo (curl \
            --header "Authorization: Bearer $TOKEN" \
            --header "Content-Type: application/vnd.api+json"  \
            --request POST \
            --data '{"data":{"type": "authentication-tokens", "attributes": {"description": "auto-generated"}}}' \
            https://$HOST/api/v2/agent-pools/$AGENT_POOL_ID/authentication-tokens 2> /dev/null \
        | jq -r .data.attributes.token)
end

function atlas_open -d "Opens atlas UI"
    open "https://$(atlas_hostname)"
end

function atlas_logs -d "Watches atlas logs"
    tfcdev stack logs atlas
end

function agent_build -d "Builds the agent"
    set CURRENT_DIR (pwd)
    cd /Users/dschmidt/work/hashicorp/tfc-agent && make bin && cd $CURRENT_DIR
end

function agent_run -d "Runs the agent"
    $AGENT_PATH/bin/tfc-agent -auto-update disabled -token (agent_token) -address https://(atlas_hostname)
end

function agent_build_and_run -d "Builds and runs the agent"
    agent_build && agent_run
end
