resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket        = "unique-they-said-tf-state"
  force_destroy = true
}

resource "aws_codepipeline" "codepipeline" {
  name     = "crdPipelineTF5"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"

  }

  stage {
    name = "Source"

    action {
      name             = "ApplicationSource"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["Source"]
      run_order        = 1

      configuration = {
        ConnectionArn        = aws_codestarconnections_connection.gh_codestar.arn
        FullRepositoryId     = var.repo
        BranchName           = var.branch
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "BuildContainerImage"
      category         = "Build"
      run_order        = 1
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["Source"]
      output_artifacts = ["ImageDefinition"]
      version          = "1"

      configuration = {
        ProjectName  = aws_codebuild_project.crd_codebuild.name
        BatchEnabled = false
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["ImageDefinition"]
      version         = "1"

      configuration = {
        ClusterName       = var.ClusterStack
        ServiceName       = var.ServiceStack
        DeploymentTimeout = "10"
      }
    }
  }
}