import 'package:flutter/material.dart';

class PasswordTextfieldView extends StatefulWidget {
  const PasswordTextfieldView({Key? key, this.textEditingController})
      : super(key: key);
  final TextEditingController? textEditingController;

  @override
  State<PasswordTextfieldView> createState() => _PasswordTextfieldViewState();
}

class _PasswordTextfieldViewState extends State<PasswordTextfieldView> {
  bool _isSecure = true;
  final Icon _visibilityOn = const Icon(Icons.visibility_outlined);
  final Icon _visibilityOff = const Icon(Icons.visibility_off_outlined);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.phone,
      obscureText: _isSecure,
      obscuringCharacter: '#',
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: 'hint',
        suffix: IconButton(onPressed: _changeVisibility, icon: AnimatedCrossFade(firstChild: _visibilityOn, secondChild: _visibilityOff, crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: const Duration(milliseconds: 250)))
        // InkWell(onTap: _changeVisibility, child: Icon(_isSecure ? Icons.visibility_off : Icons.visibility)),
      ),
    );
  }

  void _changeVisibility() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }
}
