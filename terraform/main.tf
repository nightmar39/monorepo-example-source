terraform {
  required_providers {
    codefresh = {
      source = "codefresh-io/codefresh"
      version = "0.0.24"
    }
  }
}

provider "codefresh" {
  api_url = "https://g.codefresh.io/api"
  token   = "617cca8ae32e95bc27081a64.5f0555ff31ed425abe391aff2531112b"
}

resource "codefresh_project" "monorepo_proj" {
  name = "monorepo_project"
}

resource "codefresh_pipeline" "monorepo_pipe" {

  lifecycle {
    ignore_changes = [
      revision
    ]
  }

  name = "${codefresh_project.monorepo_proj.name}/monorepo-test"

  tags = [
    "terraform",
    "test",
  ]

  spec {
    concurrency         = 1
    branch_concurrency  = 1
    trigger_concurrency = 1

    priority    = 5

    spec_template {
      repo        = "nightmar39/monorepo-example-source"
      path        = "../codefresh/codefresh.yaml"
      revision    = "main"
      context     = "github"
    }

    trigger {
      branch_regex  = "/.*/gi"
      context       = "github"
      description   = "Trigger for commits"
      events        = [
        "push.heads"
      ]
      modified_files_glob = "color/**"
      name                = "color-trigger"
      provider            = "github"
      repo                = "nightmar39/monorepo-example-source"
      disabled            = false
      type                = "git"
      variables = {
        IMAGE_NAME = "color-app"
        WORKING_DIRECTORY = "color"
      }
    }

    trigger {
      branch_regex  = "/.*/gi"
      context       = "github"
      description   = "Trigger for commits"
      events        = [
        "push.heads"
      ]
      modified_files_glob = "flask-ui/**"
      name                = "flask-trigger"
      provider            = "github"
      repo                = "nightmar39/monorepo-example-source"
      disabled            = false
      type                = "git"
      variables = {
        IMAGE_NAME = "flask-ui"
        WORKING_DIRECTORY = "flask-ui"
      }
    }  

    termination_policy {
      on_terminate_annotation = false
      on_create_branch {
        ignore_trigger = false 
      } 
    }

  }
}