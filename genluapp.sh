#!/bin/bash

if [ $# -ne 2 ]; then
    echo "$0 [appdir] [entry script name]"
    exit
fi

# change directory
cd $1

# correct info
scriptName=`basename $2 .lua`

# check file existence.
if ! [ -e "${scriptName}.lua" ]; then
    echo "${scriptName}.lua doesn't exist."
    exit
fi

if [ -e app.sh ]; then
    echo "app.sh file exists! Move the file. Abort"
    exit
fi

# build app.sh
cat <<EOF > app.sh
#!/bin/bash
apppath=\`which \$0\`
appdir=\$(dirname \$(realpath \${apppath}))
LUA_PATH="\${LUA_PATH};\${appdir}/?.lua;./?.lua"
export LUA_PATH
lua \${appdir}/${scriptName}.lua "\$@"
EOF

# give execution permission
chmod u+x app.sh

# then make symlink to app.sh with name of appdir
appName=`basename $(pwd)`
target=`realpath app.sh`
ln -s $target $appName

