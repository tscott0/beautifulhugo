git clone https://github.com/1138-4EB/beautifulhugo.git tmpRepo
cd tmpRepo
git fetch origin
git config --local user.name 1138-4EB
git config --local user.email "1138-4EB@users.noreply.github.com"
export GIT_COMMIT_SHA=`git rev-parse --verify HEAD`
export GIT_COMMIT_SHA_SHORT=`git rev-parse --short HEAD`

cp -r exampleSite ../tmpSite
cd ..
mkdir tmpSite/themes
cp -r tmpRepo tmpSite/themes/tmpRepo

cd tmpRepo
git checkout deploy
cp config.toml ../tmpSite/
git checkout gh-pages
git rm -rf .
cd ..

mkdir tmpHugo
cd tmpHugo
wget https://github.com/spf13/hugo/releases/download/v0.18.1/hugo_0.18.1_Windows-64bit.zip
unzip hugo_0.18.1_Windows-64bit.zip
cd ../tmpSite
../tmpHugo/hugo_0.18.1_windows_amd64.exe -t tmpRepo -d ../tmpRepo

cd ../tmpRepo
git add .
git rm -rf .gitkeep
git commit -m "Scripted GIT_COMMIT_SHA_SHORT"
cd ..
rm -rf tmpSite
rm -rf tmpHugo
rm -rf tmpRepo