workflow "create Master <- develop Pull Request" {
  on = "push"
  resolves = ["Create Pull Request"]
}

action "Filter develop branch only" {
  uses = "actions/bin/filter@master"
  args = "branch develop"
}

action "Create Pull Request" {
  uses = "./.github/actions"
  needs = ["Filter develop branch only"]
  secrets = [
    "GITHUB_TOKEN"
  ]
  env = {
    PULL_REQUEST_TITLE = "master from develop"
    PULL_REQUEST_BODY = "From GitHub Actions"
    BASE_BRANCH = "master"
    HEAD_BRANCH = "develop"
  }
}
