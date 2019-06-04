# luapp
Generates bootstrap shell script for lua script which consists of multiple sciprt modules.

## Motivation
When you write lua scripts consists of some modules, and when you want to run the script outside the directory scripts locate...

eg. file converter
~~~
$ lua /path/to/lua/script.lua files...
lua:  /path/to/lua/script.lua:1: module 'sample' not found:
	no field package.preload['sample']
	no file '/usr/share/lua/5.3/sample.lua'
	no file '/usr/share/lua/5.3/sample/init.lua'
	no file '/usr/lib/lua/5.3/sample.lua'
	no file '/usr/lib/lua/5.3/sample/init.lua'
	no file './sample.lua'
	no file './sample/init.lua'
	no file '/usr/lib/lua/5.3/sample.so'
	no file '/usr/lib/lua/5.3/loadall.so'
	no file './sample.so'
stack traceback:
	[C]: in function 'require'
	/path/to/lua/script.lua:1: in main chunk
	[C]: in ?
~~~
Umm...

## Usage
1. run below command
~~~
$ ./genluapp.sh [/path/to/your/lua/script/directory] [your_entry_point_script.lua]
~~~

2. You can see `app.sh` and `your_lua_directory_name` symlink in your lua directory.

app.sh is a bootstrap shell script which sets LUA_PATH so that lua interpreter can find modules.
The symlink is a symlink to app.sh. You can place this file to the directory such as .local/bin

## Now you can
~~~
$ /path/to/your/app.sh files...
done.
~~~
nice.
