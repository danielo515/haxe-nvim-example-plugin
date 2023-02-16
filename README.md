# haxe-nvim example_plugin

This is a template project to create NeoVim plugins using [haxe](https://haxe.org/) via the [haxe-nvim](https://github.com/danielo515/haxe-nvim) library.

## How to use this template

There are several simple ways to use this template:
- You can just create a new repository on github and select this repository as template for your new project. 
- Alternatively you can just clone this repository and remove the `.git` folder
- or you can download the zip containing the source code of this repository and unzip it

It is all up to you!

Once you did one of the previous steps, I recommend the following:

1. run `haxelib install libs.hxml` so you get the required libraries and dependencies
1. run `haxe build.hxml` to check that everything compiles and works out of the box
1. rename all appearances of example_plugin to the name you want to give you your plugin
1. explore `src/Main.hx` to get an idea of how you can start writing your own plugin
1. delete the parts of this readme that do not apply to your plugin, like this first sections 
1. update the installation instructions and documentation to match those of your plugins

## Workflow

Just add files and functions to the `src` folder. 
I recommend you to avoid inheritance and subclassing because those are not very good supported 
in the Lua target. I suggest you to focus and take advantage of the **many functional** capabilities
Haxe has, such as:
- lambas `() -> ` 
- module level static functions (this will save you a lot of boilerplate)
- static extensions (we include some by default)

You must commit the generated Lua code. Most (if not all) NeoVim plugin managers will just clone 
your plugin repository to the required NeoVim folders, and they will expect your plugin repository 
to contain all the required plugin files, which in the case of haxe-nvim projects is the `lua` folder.

When you want to test your plugin, just build it using `haxe build.hxml` and then test it in NeoVim.
One of the simplest ways of testing this plugin in NeoVim is using packer and adding your local
path in your filesystem where your plugin is just like any other NeoVim plugin. Something like:

```lua
use { 
  '~/GIT/your-plugin-folder',
   config = function()
     require "example_plugin"
   end,
}
```

## Differences from regular Haxe projects

If you are already familiar with Haxe you may feel there are some differences between this project
and regular Haxe projects.
Note that NeoVim has some very specific requirements and the regular Haxe ways of doing things not always work.
For that reason, haxe-nvim not only includes bindings to (almost all) NeoVim APIs, but also several
macros and function helpers that work better within the NeoVim scope.
Defaults of this example project have been chosen because they have been proven reliable and to work
good inisde NeoVim plugins. That includes the default opens(take a look at `src/import.hx`), 
the provided helper functions and even the Macros. Everything was tested and is being used in my 
personal (and main) NeoVim configuration, and let me tell you that making all that work properly was
not a trivial task!

```
| Your plugin Readme should start right below here |
⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄⌄
```
# example_plugin

## How to install this plugin

This NeoVim plugin can be installed just like any other plugin. Use your plugin manager of choice.
We provide example instructions for [packer.nvim](https://github.com/wbthomason/packer.nvim)

### Using packer

```lua
use { 
  'danielo515/haxe-nvim-example-plugin',
   config = function()
     require "example_plugin"
   end,
}
```
