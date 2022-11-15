# Satel QA Deployment
This centralized GitHub action deploys a webapp to QA environment/VM

## Usage 
```yml
name: "QA deployment"
on:
  push:
    branches:
      - main  
deploy-to-qa:
    name: Deploy webapp to QA vm
    needs: [generate-variables, build-client, build-server]
    if: github.ref == 'refs/heads/main' # run only on main
    runs-on: <host_name>
    steps:
      - name: Deploy to QA vm
        uses:  SatelCreative/satel-qa-deployment@v1
        with:
          app-name: <name-of-the-app>
          clean-branch-name: ${{ needs.registry-push.outputs.clean-branch-name }}
          satel-docker-user: ${{ secrets.SATEL_DOCKER_USER }}
          satel-docker-pass: ${{ secrets.SATEL_DOCKER_PASS }}
          satel-registry: docker.satel.ca
```
 - `host_name` is `self-hosted` or the name of server where the action runner is hosted, `cosmicray` for example
 - `app-name` can be st-pim or sb -pim for example
 - `clean-branch-name` parameter is set in a previous step  
 - `satel-docker-user` & `satel-docker-pass` are secrets added from the settings.           
