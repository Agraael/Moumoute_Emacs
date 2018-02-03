# Moumoute Emacs

> Not the Editor you need , but the one you deserve...\
> Ou l'IDE du pauvre !!

**Greetings my fellows Emacs noobs\
Do you still use your favourite Editor as Vanilla ? \
Do you envy others with their _Sublime_ , _Atom_, _CLion_ or even _VIM_ !!!! ?\
But you realy like Emacs enviroment , but you don't know how to customize yours !!**

##### GUESS WHAT ????? I GOT SOMETHING FOR YOU !!

As an Epitech student you have to improve your skills but also your workspace and tools. \
That's why i made this tiny project , to help you in studies , to help people in need ! 

### Features

- Monokai theme
- Epitech Headers
- 80 col norm (better than  the one in myemacs)
- code compilation and error checking with Clang (or gcc)
- static code analysis with cppcheck
- new editing and navigation tools
- autocompletion
- snippet package + some made by myself
- and more ...

For more information on future features go check the [Todo list](todo.md)

### Installation 

Well ... , for now you just have to clone the repository (the project is a  fu***** mess)\
Moumoute is _standalone_ , it doesn't modify your Emacs configuration , everything is stored **Moumoute_Emacs** directory.
```
git clone https://github.com/Agraael/Moumoute_Emacs.git
```
In future versions the installation will be more complex.

### Requirement

- Emacs 24.5 or above
- clang
- cppcheck
- python3

### Usage
```
cd Moumoute_Emacs
./Memacs -h
```
```
usage: Memacs [OPTION] [FILE [FILE ...]]

Memacs open a Moumoute_emacs Client connected to a Local Moumoute Server if
the Moumoute Server doesn't exist, it is created by Memacs the Moumoute Server
can be stoped (it will kill all client) and launched manually. You can also
Launch a non client Moumoute_emacs

positional arguments:
  FILES             Visit file using find-file

optional arguments:
  -h, --help        show this help message and exit
  -n, --noserver    Lauching a Moumoute_emacs non-client
  -r, --runserver   Start Moumoute_emacs Server in the background without
                    opening a Client
  -s, --stopserver  Gracefully stops Moumoute_server. This should save your
                    files first (pending for test).
  -k, --killserver  Kills Moumoute_server Warnning : This will not save files.
                    Prefer -s if possible.
  --just-sauce      Use this in case of bug emergency !!!
  --raw-sauce       This is meant for debug , not for you !!!
  --update          Update Moumoute Emacs , It's Important !!!
  --version         Huehuehue !!!

```

> New User :  WOWOWOW what's all this  ... \
> Me : well let me  explain ! 

**Moumoute_Emacs** have two mode , **Server mode** and **Non-Server mode**. \
By default **Memacs** will use the server mode.\
But what is this Mode u may ask .\

Well it's pretty simple , **Memacs** use Daemon feature since emacs 23  \
to create a local server to be the root of your emacs session.\
All you have to know is that all buffers will be stocked in that server.

More information here -> [Emacs as Daemon](https://www.emacswiki.org/emacs/EmacsAsDaemon)

```
./Memacs or ./Memacs file.c ...
```
Memacs create it's own server named Moumoute_server , so it wont disturb your classic usage of Emacs deamon.\
```
./Memacs -n or ./Memacs -n file.c ...
```
using  -n  , will start a local Moumoute_Emacs instance , just like Emacs
```
./Memacs -k or ./Memacs -s
```
Well those command do the same thing, terminate the actual server.\
One **-s** is suppose to save all buffer before killing the server, **-n** don't\
If you are using **-k** , use **M-X close-all-buffers** in  Memacs session to check all your buffer \
(better commands will come later)

**Warning**, for now **./Memacs -s** don't work!!!  ....
> i'll fix that later  ... maybe ...
```
./Memacs --update
```
by now Memacs will check for update every **3 days**.\
But you can use this command for updating manually Moumoute Emacs


```
./Memacs --just-sauce
```

The emergency command !!! hahah \
Sometimes the **Moumoute_server** can be corrupted , (idk know why) and you wont be able to kill the server or launch a new one. \
**--just_sauce** is  here for that !!!

### Commands

Haaaaaa the most important part !!!!\
Here i will list and explain all command usefull for you in Moumoute Emacs\
Some are the same in emacs , some are modified , some are new.

first a little reminder about emacs command 
- **M-** stand for **Alt** key
- **C-** stand for **Ctrl** key
-  those command are meant for AZERTY , sry  guys i will and QWERTY version later
-  **C-c k** (Ctrl + c then c) will display the list of all command in **Memacs**
-  use **C-g** to cancel any command
- **C-s** search command , repeat **C-s** to switch to the next match
- **C-_** undo command

##### - noice command
- **F2** -> show the 80 col limit
- **F6** -> toggle on/off linum mode (numbers on the left)
- **F7** -> erase all useless space and tab (those in grey in the text)
- **M-;** -> use it to place automatic comment

##### - Ido-mode

Well **ido-mode** , is a display module, for commands and selection in **Memacs**\
check this -> [InteractivelyDoThings](https://www.emacswiki.org/emacs/InteractivelyDoThings) \
Ido provide autocompletion, so you have to press **TAB** for it\
_(because it will still open the classic completion windows, i need to fix this)_ 

when using ido to find a file to open , u can navigate through directory by pressing **ENTER** on a directory \
or **BACKSPACE** when the last character of the **PATH** is **\\** .

##### - AutoCompletion

- **F5** -> activate/deactivate auto-completion \
By default auto-completion is set as **True**

##### - Windows, screen and buffer commands

- **C-x C-b** -> use it to switch buffer with ido
- **C-x C-f** -> open file in new buffer (with ido)
- **C-x k** -> select a buffer to kill
- **C-x 1** -> kill buffer and current window
- **C-x 2** -> choose a file to open in a new windows below the current one and switch to it
- **C-x 3** -> same thing but on the right
- **C-x 4** -> delete window
- **C-x 5** -> delete all other windows
- **C-x 6** -> Kill the current buffer

use **Alt + arrow** to move into different window \
if you are on Terminator it's **Alt+Maj + arrow**

- **C-z C-c** -> create new screen and switch to it
- **C-z C-f** -> create new screen and open file
- **C-z C-k** -> kill current screen
- **C-z M-k** -> kill current screen and buffers
- **C-M-prior** and **C-M-next** to switch screen

##### - Query replace

- **M-%** -> classic command for query
- **M-µ** -> query replace on the word at the cursor

after typing the replace word use
- **y** to replace one
- **n** to skip
- **!** to replace all

##### - Code checking and analysis

- **F8** -> activate/deactivate code compilation and analysis \
by default this option is set to **True**
- **F9** open/close the error/warning window \
**Error** in **RED**\
**Warning** in **YELLOW** \
**Suggestion** in **BLUE**

use the error window to see from witch checker the error come from \
by default for **c/c++** i use **clang/clang++ -std=c++14** and **cppcheck**

##### - aggressive indentation

- **F12** -> activate/deactivate aggressive indentation \
Set as **True** by default 

##### - directory tree
- **F10** -> open/close directory tree window \
allow you to move through your files and directory like in other Editors

some time **F10** is used by your terminal to toggle the menu bar \
those command only work inside the directory tree window
- **H** -> Hide/Show hidden files
- **g** -> Refresh
- **RET** (or **ENTER**) on file or directory to open it
- **C-c C-n** -> Create a file or create a directory if filename ends with a ‘/’
- **C-c C-c** -> Change the root directory
- **C-c C-r** -> Rename a file or a directory
- **C-c C-d** -> Delete a file or a directory
- **C-c C-p** -> Copy a file or a directory

##### More  command will come .... 
##### Thank for reading this awfull  README , good luck with Moumoute_Emacs
