#!bin/sh
#========
GITHUB_ACCOUNT=Motchart
WS_DIR=NewWorkSpace
REPO_NAME=Title-Validation-csv-File
APP_VERSION=1.3
MAIN_CLASS=core.Selenium
v_01=
#====

if ! which java >/dev/null 2>&1 ; then echo Java not installed; return; fi
if ! which mvn >/dev/null 2>&1 ; then echo Maven not installed; return; fi
if ! which git >/dev/null 2>&1 ; then echo Git not installed; return; fi

if [ -d "$HOME/$WS_DIR" ] ; then cd ~/$WS_DIR; else echo $WS_DIR directory is not exist; return; fi
if [ -d "$HOME/$WS_DIR/$REPO_NAME" ] ; then rm -rf $HOME/$WS_DIR/$REPO_NAME; fi

git clone https://github.com/$GITHUB_ACCOUNT/$REPO_NAME

cd ./$REPO_NAME

mvn package -Dbuild.version="1.3" -DmainClass="core.Selenium"
echo "executing JAVA program .."
java -jar $HOME/$WS_DIR/$REPO_NAME/target/$REPO_NAME-$APP_VERSION-jar-with-dependencies.jar $MAIN_CLASS  $v_01	
