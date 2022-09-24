import 'package:boiler_plate_killer/pages/entity_boilerplate/entity_boilerplate_notifier.dart';
import 'package:boiler_plate_killer/util/style/bpk_text_style.dart';
import 'package:boiler_plate_killer/widgets/line_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntityBoilerplate extends StatefulWidget {
  EntityBoilerplate({Key? key}) : super(key: key);

  @override
  State<EntityBoilerplate> createState() => _EntityBoilerplateState();
}

class _EntityBoilerplateState extends State<EntityBoilerplate> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child: Consumer<EntityBoilerplateNotifier>(
      builder: (context, notifier, _) {
        return Column(children: [
          const Text('Entity Factor'),
          OutlinedButton(
              onPressed: notifier.generateEntityFlag == true
                  ? () {
                      notifier.generateEntity(_inputController.text);
                    }
                  : null,
              child: Text('Generate')),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  fit: FlexFit.loose,
                  child: LineCounter(lineLength: notifier.lineCount)),
              Expanded(
                  flex: 20,
                  child: TextField(
                      style: BpkTextStyle.editorText,
                      controller: _inputController,
                      keyboardType: TextInputType.multiline,
                      onChanged: (String value) {
                        notifier.checkStringLength(value);
                      },
                      maxLines: null))
            ],
          ),
        ]);
      },
    )));
  }
}
