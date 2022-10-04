import 'package:flutter/cupertino.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Boiler Plate Killer', style: TextStyle(fontSize: 18)),
          SizedBox(height: 12),
          Text('MIT LICENSE')
        ],
      ),
    );
  }
}
