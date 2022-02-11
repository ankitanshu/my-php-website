#!/usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('0: Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('1: Git Pull') {
            steps {
                git branch: 'master', url: 'https://github.com/ankitanshu/my-php-website.git'
            }
        }
        stage('2: Docker Build') {
            steps{
                sh "docker build . -t ankitanshu/my-php-proj"
            }
        }
        stage('3: Docker Hub Push') {
            steps{
                withCredentials([string(credentialsId: 'docker-hub-pwd', variable: 'docker-hub-pwd')]) {
                      echo "${docker-hub-pwd}"
                      sh "docker login -u ankitanshu -p ${docker-hub-pwd}"
                }
                sh "docker push ankitanshu/my-php-proj"
            }
        }
        stage('4: Push Ansible Config to install Docker') {
            steps {
                ansiblePlaybook credentialsId: 'centos-key', inventory: 'myinventory.ini', playbook: 'docker-playbook.yml'
            }
        }
        stage('5: Push Ansible Config to deploy Docker Container') {
            steps {
                ansiblePlaybook credentialsId: 'centos-key', inventory: 'myinventory.ini', playbook: 'deploy-playbook.yml'
            }
        }
    }
}
