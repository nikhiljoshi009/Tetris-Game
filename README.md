# Tetris Game

Tetris game built with React

<h1 align="center">
  <img alt="React tetris " title="#React tetris desktop" src="./images/game.jpg" />
</h1>


### Use Sonarqube block 
```
environment {
    SCANNER_HOME=tool 'sonar-scanner'
}

stage("Sonarqube Analysis "){
    steps{
        withSonarQubeEnv('sonar-server') {
          sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=$TAG \
          -Dsonar.projectKey=$TAG '''
        }
    }
}
```        

### Owasp block
```
stage('OWASP FS Scan') {
    steps {
        withEnv(['JAVA_OPTS=-Xmx6g']) {
          dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-Check'
          dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
        }
    }
}
```

## ARGO CD SETUP
    https://archive.eksworkshop.com/intermediate/290_argocd/install/

## Image updater stage
```
environment {
    GIT_REPO_NAME = "Tetris-Game"
    GIT_USER_NAME = "ajaydabe"
}

stage('Update Deployment-Service File') {
    steps {
        script {
            withCredentials([string(credentialsId: 'github', variable: 'GITHUB_TOKEN')]) {
              // Determine the image name dynamically based on your versioning strategy
              NEW_IMAGE_NAME = "ajaydabe/tetris:$TAG"

              // Replace the image name in the deployment-service.yaml file
              sh "sed -i 's|image: .*|image: $NEW_IMAGE_NAME|' deployment-service.yml"

              // Git commands to stage, commit, and push the changes
              sh 'git add deployment-service.yml'
              sh "git commit -m 'Update deploy-svc image to $NEW_IMAGE_NAME'"
              sh "git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main"
            }
        }
    }
}

```
