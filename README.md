# Debug local

- Run "Debug executable" launch configuration
- Open http://localhost:3000/api/HttpExample?name=SomeName

# Deploy local
- Run "Debug local function" launch configuratio
- OR run `bash ./scripts/deploy-local.sh` in terminal

# Deploy Azure
- run `bash ./scripts/deploy-remote.sh` in terminal
- check comments if any issues

# Clean up
- run `bash ./scripts/clean-remote.sh` in terminal


# TODO:
- Optimize package size https://github.com/johnthagen/min-sized-rust (currently ~1.9 Mb)