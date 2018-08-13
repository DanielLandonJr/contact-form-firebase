
#!/bin/bash

# first arg is for minify. if set to true the css/js will be obsfucated...if false the files will still be minified but readable.

# second arg is for gh-pages. if true will deploy project to gh-pages on github. Must have a valid "homepage" entry in package.json file

clear

echo -e "\033[1;95m=> => => \033[1;33mSTARTING DISTRIBUTION FOLDER BUILD \033[1;95m<= <= <=\033[0m"
echo

date

echo
echo -e "\033[1;33m=> => => \033[1;95mREMOVING OLD DEVELOPMENT FOLDER \033[1;33m<= <= <=\033[0m"
rm -rf .\\dist
echo

echo
echo -e "\033[1;33m=> => => \033[1;95mCREATE FOLDERS STARTED \033[1;33m<= <= <=\033[0m"
echo

echo Creating New dist Folder
mkdir .\\dist

echo Creating New dist/css Folder
mkdir .\\dist\\css

echo Creating New dist/css/lib Folder
mkdir .\\dist\\css\\lib

echo Creating New dist/js Folder
mkdir .\\dist\\js

echo Creating New dist/js/lib Folder
mkdir .\\dist\\js\\lib

echo Creating New dist/assets Folder
mkdir .\\dist\\assets

echo Creating New dist/assets/audio Folder
mkdir .\\dist\\assets\\audio

echo Creating New dist/assets/img Folder
mkdir .\\dist\\assets\\img

echo Creating New dist/assets/video Folder
mkdir .\\dist\\assets\\video

echo Creating New dist/modules Folder
mkdir .\\dist\\modules

echo
echo -e "\033[1;33m=> => => \033[1;95mCOPY FILES STARTED \033[1;33m<= <= <=\033[0m"
echo

echo Copying Images from dev/assets/img to dist/assets/img
# cp -rf dev/assets/img/*.* dist/assets/img

# check if the file exists...if it does then copy otherwise skip it
[[ -e dev/assets/img/*.* ]] && cp -rf dev/assets/img/*.* dist/assets/img

echo Copying Audio from dev/assets/audio to dist/assets/audio
# cp -rf dev/assets/audio/*.* dist/assets/audio
[[ -e dev/assets/audio/*.* ]] && cp -rf dev/assets/audio/*.* dist/assets/audio

echo Copying Video from dev/assets/video to dist/assets/video
# cp -rf dev/assets/video/*.* dist/assets/video
[[ -e dev/assets/video/*.* ]] && cp -rf dev/assets/video/*.* dist/assets/video

echo Copying CSS Lib from dev/css/lib to dist/css/lib
# cp -rf dev/css/lib/*.* dist/css/lib
[[ -e dev/css/lib/*.* ]] && cp -rf dev/css/lib/*.* dist/css/lib

echo Copying JS Lib from dev/js/lib to dist/js/lib
# cp -rf dev/js/lib/*.* dist/js/lib
[[ -e dev/js/lib/*.* ]] && cp -rf dev/js/lib/*.* dist/js/lib

echo Copying Pages from dev/modules to dist/modules
# cp -rf dev/modules/*.* dist/modules
[[ -e dev/modules/*.* ]] && cp -rf dev/modules/*.* dist/modules

echo Copying Index from dev to dist
# cp -rf dev/index.html dist
[[ -e dev/index.html ]] && cp -rf dev/index.html dist

echo
echo -e "\033[1;33m=> => => \033[1;95mMINIFY ASSETS STARTED \033[1;33m<= <= <=\033[0m"
echo

if ($1 = true)
then
	echo Minifying CSS w/obsfucation
	cleancss dev/css/main.css -o dist/css/main.min.css
	echo ''
	echo Minifying JavaScript w/obsfucation
	uglifyjs dev/js/main.js -o dist/js/foo.min.js -c -m --mangle-props
else
	echo Minifying CSS
	cleancss dev/css/main.css -o dist/css/main.min.css
	echo ''
	echo Minifying JavaScript
	uglifyjs dev/js/main.js -o dist/js/main.min.js
fi

if ($2 = true)
then
	echo ''
	echo -e "\033[1;33m=> => => \033[1;95mDEPLOYING PROJECT TO GH-PAGES \033[1;33m<= <= <=\033[0m"
	echo ''
	gh-pages -d dist
else
	echo ''
	echo -e "\033[1;33m=> => => \033[1;95mNOT DEPLOYING PROJECT TO GH-PAGES \033[1;33m<= <= <=\033[0m"
	echo ''
fi

date

echo
echo -e "\033[1;95m=> => => \033[1;33mCOMPLETED DISTRIBUTION FOLDER BUILD \033[1;95m<= <= <=\033[0m"
echo

