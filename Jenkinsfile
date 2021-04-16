node('k8s-node') {

    stage('clone') {
        git 'https://github.com/shivi-bit/node-repo.git' 
    } 

    stage('build') {
        sh 'sudo docker build -t  shivangani/my-node-app:${BUILD_NUMBER} .'
    }

    stage('publish') {
        sh 'sudo docker push  shivangani/my-node-app:${BUILD_NUMBER} '
    }

    stage('deploy'){
    git 'https://github.com/shivi-bit/node-repo.git'
    sh  'sed -i \\\'s/{{TAG}}/\\\'${BUILD_NUMBER}\\\'/G\\\' deployment.yml'
    sh  'set +e'
    cat 'deployment.yml'
    kubectl 'apply -f deployment.yml -n node-application'
    }
}