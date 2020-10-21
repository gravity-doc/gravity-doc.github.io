---
sort: 3
---
#Module environment

## Use modules

Gravity provides a lot of softwares and libraries pre-installed.





## Add your own modulefiles

Users can create a *.modulerc* file in your home directory.  
In this file, you can add new paths to your own modulefiles to the environmental variable *MODULEPATH*.
```bash
#%Module1.0#####
append-path MODULEPATH /home/user1/mymodulefiles
```
Note that `#%Module1.0#####` is required at the first line.

When you use `module` command, system can also find modulefiles in this directory.

## Write your own modulefiles

After installing some software, saying `FFTW-3.3.4`, you may want to create your own modulefiles for it.

First, you should create a folder named *FFTW* inside your own modulefiles path (*/home/user1/mymodulefiles/FFTW* in this case).
Second, create a file named *3.3.4*.
Add the following content to this file.
```bash
#%Module1.0#####################################################################
##
## modules modulefile
##
## modulefiles/modules.  Generated from modules.in by configure.
##
proc ModulesHelp { } {
        global version prefix

        puts stderr "\tmodules - loads the modules software & application environment"
        puts stderr "\n\tThis adds $prefix/* to several of the"
        puts stderr "\tenvironment variables."
        puts stderr "\n\tVersion $version\n"
}

module-whatis   "fftw 3.3.4"

set version     3.3.4
set prefix      /home/user1/fftw-3.3.4

set root    $prefix

prepend-path      PATH              $root/bin
prepend-path      MANPATH           $root/man
prepend-path      LIBRARY_PATH      $root/lib
prepend-path      LD_LIBRARY_PATH   $root/lib
prepend-path      LD_RUN_PATH       $root/lib
prepend-path      CPATH             $root/include

prereq softA
conflict softB
```
Again, the first line is required.

`module-whatis` sets the content when you use `module whatis` shows.

`set` command sets values for the variables.

`prepend-path PATH new_path` adds new path before the paths already exist in the environmental variables *$PATH*.

Similarly, `append-path` adds new path after the paths.
Note that the order matters if in the environmental variables there exist multiple paths to different versions of the same software.

`prereq` can set the dependence.  In this case, you can not load this module if *softA* has not been loaded.

`conflict` specifies the module that conflict with this one.  You can not load this module if *softB* has been loaded.


