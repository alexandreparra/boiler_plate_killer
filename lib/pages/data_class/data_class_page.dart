import 'package:boiler_plate_killer/util/extension/context_extensions.dart';
import 'package:boiler_plate_killer/util/style/bpk_text_style.dart';
import 'package:boiler_plate_killer/widgets/line_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_class_notifier.dart';

class DataClassPage extends StatefulWidget {
  const DataClassPage({Key? key}) : super(key: key);

  @override
  State<DataClassPage> createState() => _DataClassPageState();
}

class _DataClassPageState extends State<DataClassPage> {
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
    return Consumer<DataClassNotifier>(builder: (context, notifier, _) {
      return Scaffold(
          floatingActionButton: ElevatedButton(
            onPressed: notifier.generateDataClassFlag == true
                ? () async {
                    final status = await notifier.generateDataClass(context,
                        _classNameController.text, _fieldsController.text);
                    context.showSnackBar(status);
                  }
                : null,
            child: const Text('Generate'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const Text('Data Class Factory'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                          controller: _classNameController,
                          onChanged: notifier.checkClassName,
                          decoration:
                              const InputDecoration(hintText: 'Class name')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: DropdownButtonFormField<String>(
                          value: notifier.classPostfixes.first,
                          items: notifier.classPostfixes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: notifier.selectClassPostfix,
                          decoration: const InputDecoration(
                              hintText: 'Class termination')),
                    ),
                    const SizedBox(height: 12),
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
            ),
          ));
    });
  }
}
