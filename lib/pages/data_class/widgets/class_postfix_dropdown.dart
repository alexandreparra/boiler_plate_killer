import 'package:flutter/material.dart';

class ClassPostfixDropdown extends StatelessWidget {
  final List<String> classPostfixes;
  final void Function(String?) onChanged;

  const ClassPostfixDropdown(
      {Key? key, required this.classPostfixes, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        value: classPostfixes.first,
        items: classPostfixes.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: value.isNotEmpty
                ? Text(value)
                : const Text(
                    "Empty",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(hintText: 'Class termination'));
  }
}
