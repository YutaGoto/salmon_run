workflow "create Master <- develop Pull Request" {
  on = "push"
  resolves = ["Create Pull Request"]
}

action "Create Pull Request" {
  uses = "./github/actions"
  secrets = [
    "GITHUB_TOKEN"
  ]
  env = {
    PULL_REQUEST_TITLE = "Actions sync master <- develop"
    PULL_REQUEST_BODY = "From GitHub Actions"
    BASE_BRANCH = "master"
    HEAD_BRANCH = "develop"
    TEMP_SUFFIX = "_resolve_conflict"
  }
}
