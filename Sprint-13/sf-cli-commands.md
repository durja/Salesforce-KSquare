# Check Salesforce CLI
sf --version

# Login to Salesforce
sf org login web

# List authenticated orgs
sf org list

# Set an org alias
sf alias set PlacementOrg=<username>

# Retrieve metadata
sf project retrieve start

# Deploy metadata
sf project deploy start

# Run Apex tests
sf apex run test --test-level RunLocalTests
