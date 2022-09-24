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
  final _fieldsController = TextEditingController();
  final _classNameController = TextEditingController();

  @override
  void dispose() {
    _fieldsController.dispose();
    _classNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntityBoilerplateNotifier>(builder: (context, notifier, _) {
      return Scaffold(
          floatingActionButton: ElevatedButton(
            child: Text('Generate'),
            onPressed: notifier.generateEntityFlag == true
                ? () {
                    notifier.generateEntity(
                        _classNameController.text, _fieldsController.text);
                  }
                : null,
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 12),
              const Text('Entity Factory'),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextField(
                      controller: _classNameController,
                      onChanged: notifier.checkClassName,
                      decoration: InputDecoration(hintText: 'Class name'))),
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
                          controller: _fieldsController,
                          keyboardType: TextInputType.multiline,
                          onChanged: notifier.checkFieldsLength,
                          maxLines: null))
                ],
              ),
            ]),
          ));
    });
  }
}
