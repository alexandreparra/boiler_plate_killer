import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Boiler Plate Killer', style: TextStyle(fontSize: 22)),
            SizedBox(height: 12),
            Text('MIT LICENSE')
          ],
        ),
      ),
    );
  }
}
