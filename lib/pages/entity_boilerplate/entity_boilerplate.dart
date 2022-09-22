import 'package:flutter/material.dart';

class EntityBoilerplate extends StatelessWidget {
  const EntityBoilerplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(body: Column(
        children: [
          const Text('Entity Factor'),
          const TextField(),
        ],
      ));
  }
}
