# State Removal

Sometimes, we need to remove things from state.

Rather than doing it locally, we can add to the two `build` jobs. Here's an example:

```
  before_script:
    - gitlab-terraform init
    - gitlab-terraform state rm module.kubernetes_gitlab_runner.helm_release.main
    - gitlab-terraform state rm module.kubernetes_gitlab_runner.null_resource.helm_repo_add
    - gitlab-terraform state rm module.kubernetes_gitlab_runner.gitlab_user_runner.main
    - gitlab-terraform state rm module.kubernetes_gitlab_runner.kubernetes_namespace.main
    - gitlab-terraform state rm module.kubernetes_gitlab_runner.kubernetes_secret.main
```
