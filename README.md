# Boiler Plate Killer

Developer tool to ease Dart/Flutter development. Still in very early development.

## Getting Started

BoilerPlateKiller is a simple application to simplify Dart/Flutter development. The program is meant 
to be run on the desktop (Windows, Linux and MacOS) as this is where we program and the file saving api is complete.

For the moment the only way to use the application is by cloning and locally compiling it.

Below you'll find the description of the current capabilities.

## Data Class Factory
![preview image](/preview/data_class_factory.png)

Data Class Factory generates a file with overwritten == and hashCode methods from the given ClassName 
and parameter fields provided by you.

For the class name use the simple PascalCase naming and in the fields you should input what parameters 
the entity receives like:

```dart
// No semicolons are needed
int age
String name
```

You can select the class termination name, if for example, you choose to use the "Model" postfix,
the class name will be automatically generated as WhateverYouWroteModel, and the correspondent file will
follow the same convention.

After clicking the 'Generate' button at the bottom left you'll be prompted to save the file somewhere 
and 'flutter format' will automatically be issued on the file.

This can make it easy if you need to have a zero dependency == and hashCode generator, saving you a 
lot of time by only writing the parameters once and having the constructor, == and hashCode automatically generated.

## Known Issues
### Linux
If your file picker doesn't show up when you tell the program to generate the file, make sure you have
the 'zenity' package installed