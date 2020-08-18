pipeline {
  agent {
    label "jenkins-python"
  }
  environment {
    ORG = 'ederqueirozdf'
    APP_NAME = 'jenkinsx-custom'
    CHARTMUSEUM_CREDS = credentials('jenkins-x-chartmuseum')
    DOCKER_REGISTRY_ORG = 'erudite-buckeye-278418'
  }
  stages {
    stage('Build Release') {
      when {
        branch 'master'
      }
      steps {
        container('python') {

          // ensure we're not on a detached head
          sh "git checkout master"
          sh "git config --global credential.helper store"
          sh "jx step git credentials"
          sh "echo \$(jx-release-version) > VERSION"
          sh "jx step tag --version \$(cat VERSION)"
          sh "export VERSION=`cat VERSION` && skaffold build -f skaffold.yaml"
	 }
        }
      }
    }
  post {
        always {
          cleanWs()
        }
  }
}
