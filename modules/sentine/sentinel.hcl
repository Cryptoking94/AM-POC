# sentinel.hcl

policy "cost-limit" {
    source = "cost-limit.sentinel"
}

# Import the infracost JSON file for policy evaluation
import "json"

params = {
    infracost_file = "infracost.json"
}

mock_data = {
    infracost = json.unmarshal(read_file(params.infracost_file))
}

# Define globals to pass to the policy
global "infracost" {
    value = mock_data.infracost
}
