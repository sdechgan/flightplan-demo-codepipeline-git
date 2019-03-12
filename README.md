## CodePipeline via FlightPlan using GitHub

This repo demonstrates setting up a CodePipeline pipeline to deploy a runway project with GitHub as a source. Upon deployment, uploads to the pipeline bucket (e.g. `dev.zip` for the dev environment in this demo) will trigger a pipeline in us-west-2 that runs `runway preflight && runway takeoff`.

### Prereqs

* `pipenv` (e.g. `pip install --user pipenv`)
* git (installed out of the box on macOS)

### Configuration

First step is to modify the `flightplan.yml`

```$yaml
in:
  type: runway
  source:
    type: git
    configuration:
      Owner: sdechgan
      Repo: flightplan-demo-conduit
    env:
      dev: master
```

You need to modify the `Owner` and `Repo` of the Demo program

In this case the `Owner` is `sdechgan` and the `Repo` is `flight-demo-conduit`

### Deployment

Note: Substitute `.\make` for `make` when running on Windows

1. Execute `make build`. This will generate the CloudFormation templates and stack configuration in .flightplan/
2. Execute `make install`. This will deploy pipeline via CloudFormation.  You will be prompted to enter the GitHub OAuth Token

```aidl
make install
pipenv sync && pipenv run flightplan install
Installing dependencies from Pipfile.lock (521121)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 64/64 — 00:00:10
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
All dependencies are now up-to-date!
INFO:botocore.credentials:Found credentials in environment variables.
Deploying CodePipeline via CloudFormation
dev environment selected
Enter GitHub OAuth Token: 

```

### Teardown

Delete the `flightplan-demo-runway-dev-codepipeline` stack.
