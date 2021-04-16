node('aws-linux') {

    stage('clone') {
        git 'https://github.com/shivi-bit/node-repo.git' 
    } 

    stage('build') {
        sh 'sudo docker build -t  shivangani/my-node-app:${BUILD_NUMBER} .'
    }

    stage('publish') {
        sh 'sudo docker push  shivangani/my-node-app:${BUILD_NUMBER} '
    }
}

node('k8s-node') {
    
    stage('deploy'){
        git 'https://github.com/shivi-bit/node-repo.git'
        sh 'sed -i \'s/latest/\'${BUILD_NUMBER}\'/g\' deployment.yml'
        sh 'kubectl apply -f deployment.yml -n node-application'
    }
}