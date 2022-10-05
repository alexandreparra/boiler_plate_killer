# Boiler Plate Killer

Developer tool to ease Dart/Flutter development.

## Getting Started

BoilerPlateKiller is a simple application to fasten Dart/Flutter development. The program is meant to be run on the desktop (Windows, Linux and MacOS) as this is where we program and the file saving api is complete.

For the moment the only way to use the application is by cloning and locally compiling it.

Below you'll find the description of the current capabilities.

## Entity Factory
![preview image](/preview/entity_factory.png)

Entity Factory generates a file with overwritten == and hashCode methods from the given ClassName and parameter fields provided by you.

For the class name use the simple PascalCase naming and in the fields you should input what parameters the entity receives like:

```dart
// No semicolons are needed
int age
String name
```

After clicking the 'Generate' button at the bottom left you'll be prompted to save the file somewhere and 'flutter format' will automatically be issued on the file.

This can make it easy if you need to have a zero dependency == and hashCode generator, saving you a lot of time by only writing the parameters once and having the constructor, == and hashCode automatically generated.

