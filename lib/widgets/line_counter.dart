import 'package:boiler_plate_killer/util/style/bpk_text_style.dart';
import 'package:flutter/material.dart';

class LineCounter extends StatelessWidget {
  final int lineLength;

  const LineCounter({Key? key, required this.lineLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lineList =
        List.generate(lineLength, (index) => index == 0 ? 1 : index + 1);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          itemCount: lineList.length,
          shrinkWrap: true,
          itemBuilder: (_, i) => Text(
            '${lineList[i]}',
            textAlign: TextAlign.center,
            style: BpkTextStyle.editorText,
          )),
    );
  }
}
