import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldLearnView extends StatefulWidget {
  const TextfieldLearnView({super.key});

  @override
  State<TextfieldLearnView> createState() => _TextfieldLearnViewState();
}

class _TextfieldLearnViewState extends State<TextfieldLearnView> {
  FocusNode textFieldNode1 = FocusNode();
  FocusNode textFieldNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            maxLength: 20,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [InputFormatters().formatter],
            focusNode: textFieldNode1,
            textInputAction: TextInputAction.next,
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return Container(
                height: 10,
                width: 40.0 * ((currentLength ?? 0) / 2),
                color: Colors.red[100 * ((currentLength ?? 1) ~/ 2.5)],
              );
            },
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline),
                border: OutlineInputBorder(),
                hintText: 'Mail',
                labelText: 'Eposta'),
          ),
          TextField(
            maxLength: 20,
            focusNode: textFieldNode2,
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 10,
                width: 40,
                color: Colors.red[100 * ((currentLength ?? 1) ~/ 2.5)],
              );
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail_outline),
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const TextField(
            minLines: 2,
            maxLines: 4,
            maxLength: 200,
          )
        ],
      ),
    );
  }
}

class InputFormatters {
  final formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "é") {
      return oldValue;
    } else {
      return newValue;
    }
  });
}
