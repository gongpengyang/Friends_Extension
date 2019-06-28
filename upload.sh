#!/bin/bash

VersionString=`grep -E 's.version.*=' Friends_Extension.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`

NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' Friends_Extension.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" Friends_Extension.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git add .
git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags
pod repo push 私有库的名字(应该可以多个) Friends_Extension.podspec --verbose --allow-warnings --use-libraries 

