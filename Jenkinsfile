pipeline {
	agent any

	environment {
		PLAYERS_TT_CONFIG_FILE = credentials('5f29b607-bea6-418f-88e1-15f8f45bde15')
	}

	stages {
		stage('prepare') {
			steps {
				echo 'preparing the application'
				checkout([
					$class: 'GitSCM', 
					branches: [[name: '*/main']], 
					extensions: [], 
					userRemoteConfigs: [[url: 'https://github.com/rsmaxwell/players-tt']]
				])
				sh('./prepare.sh')
			}
		}

		stage('build') {
			steps {
				echo 'building the application'
				sh('./build.sh')
			}
		}

		stage('test') {
			steps {
				echo 'testing the application'
				sh("./test.sh")
			}
		}

		stage('deploy') {
			steps {
				echo 'deploying the application'
				sh('./deploy.sh')
			}
		}
	}
}
