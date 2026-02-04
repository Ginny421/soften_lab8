pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }

    environment {
        RESULTS_DIR = "results" [cite: 1, 9]
    }

    stages {
        stage('Cleanup') {
            steps {
                echo "Cleaning up old results..." [cite: 2, 10]
                sh "rm -rf ${RESULTS_DIR}" [cite: 2, 10]
                sh "mkdir -p ${RESULTS_DIR}" [cite: 2, 10]
            }
        }

        stage('Build Check') {
            steps {
                echo "Verifying Environment..." [cite: 3, 11]
                sh 'python3 --version' [cite: 3, 11]
                sh 'robot --version' [cite: 3, 11]
            }
        }

        stage('Run Robot Tests') {
            steps {
                # รันไฟล์ Robot ที่อยู่ในโฟลเดอร์ปัจจุบัน (หรือปรับตามที่อยู่ไฟล์จริง)
                sh "robot --outputdir ${RESULTS_DIR} Lab8.robot" [cite: 4, 12]
            }
        }
    }

    post {
        always {
            # แสดงผล Robot Framework ใน Jenkins (ต้องติดตั้ง Plugin ก่อน) [cite: 6, 14]
            step([$class: 'RobotPublisher',
                outputPath: "${RESULTS_DIR}", [cite: 7, 15]
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableReports: false, [cite: 7, 15]
                passThreshold: 100.0,
                unstableThreshold: 80.0
            ])
            
            # เก็บไฟล์ผลลัพธ์ไว้ใน Jenkins Build [cite: 15]
            archiveArtifacts artifacts: "${RESULTS_DIR}/*.*", allowEmptyArchive: true
        }
    }
}
