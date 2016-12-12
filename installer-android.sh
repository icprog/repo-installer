#!/data/data/com.termux/files/usr/bin/bash
# ---------------------------------
# repo Installer Script for Android
# ---------------------------------

TERMUXDIR=/data/data/com.termux/files/
REPOLINK=http://github.com/Rendyindo/repo-installer

echo "- Updating binary sources"
apt update

echo "- Checking whether required bin are installed..."
check(){
if [ -f "$TERMUXDIR/usr/bin/git" ]; then
 echo "git: \e[32mAvaible"
 ISGITAVAIBLE=1
else
 echo "git: \e[31mNot Avaible"
 ISGITAVAIBLE=0
 ERRFOUND=1
fi

if [ -f "$TERMUXDIR/usr/bin/curl" ]; then
 echo "curl: \e[32mAvaible"
 ISCURLAVAIBLE=1
else
 echo "curl: \e[31mNot Avaible"
 ISCURLAVAIBLE=0
 ERRFOUND=1
fi

if [ -f "$TERMUXDIR/usr/bin/python2" ]; then
 echo "Python 2.x: \e[32mAvaible"
 ISPYAVAIBLE=1
else
 echo "Python 2.x: \e[31mNot Avaible"
 ISPYAVAIBLE=0
 ERRFOUND=1
fi
}
check

if [ "$ERRFOUND" = "1" ]; then
 "- Installing missing binary"
 if [ "$ISGITAVAIBLE" = "0" ]; then
  apt install git
 fi
 if [ "$ISCURLAVAIBLE" = "0" ]; then
  apt install curl
 fi
 if [ "$ISPYAVAIBLE" = "0" ]; then
  apt install python2
 fi
 check
fi

echo "- Installing repo"
mkdir ~/bin