TOMCAT_VERS=8.0.28
TOMCAT_DIR=apache-tomcat-$TOMCAT_VERS
TOMCAT_FILE=$TOMCAT_DIR.zip
TOMCAT_ASC=$TOMCAT_FILE.asc
TOMCAT_URL=https://archive.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_VERS/bin/$TOMCAT_FILE
TOMCAT_ASC_URL=$TOMCAT_URL.asc

MYDIR=`dirname $0`

mkdir -p $MYDIR/files
gpg --import TOMCAT-8-KEYS >& /dev/null
wget -O files/$TOMCAT_ASC $TOMCAT_ASC_URL
wget -O files/$TOMCAT_FILE $TOMCAT_URL
gpg --verify files/$TOMCAT_ASC files/$TOMCAT_FILE


