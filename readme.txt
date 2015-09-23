How to run:

- Set JBOSS_HOME in system environment variables
- Make sure that 8080 port is not used (in case if not, it can be changed in pom.xml)
- Run jBoss
- From project root directory execute: mvn clean install jboss:hard-deploy