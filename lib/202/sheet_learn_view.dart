import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/listview_learn_view.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({Key? key}) : super(key: key);

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView> with BottomSheetMixin {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      body: Center(
          child: TextButton(
              onPressed: () {
                showCustomSheet(context, const ListviewLearnView());
              },
              child: const Text('data'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showCustomSheet(context, const _MyChild());
          inspect(result);
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.share_outlined),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  @override
  void initState() {
    super.initState();
    child = widget.child;
  }

  late final Widget child;

  @override
  Widget build(BuildContext context) {
    return /* Container(
      // color: _backgroundColor,
      // height: MediaQuery.of(context).size.height * 0.5,
      child: */
        Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _customSheetHeader(context),
        Expanded(child: child),
      ],
    );
    // );
  }

  Stack _customSheetHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Divider(
          color: Colors.grey,
          thickness: 3,
          indent: MediaQuery.of(context).size.width * 0.325,
          endIndent: MediaQuery.of(context).size.width * 0.325,
        ),
        Positioned(
          child: IconButton(
              splashRadius: 20,
              splashColor: Colors.amber[600],
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_outlined,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}

class _MyChild extends StatelessWidget {
  const _MyChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('data'),
        Image.network('https://picsum.photos/200/200'),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop<bool>(true);
          },
          child: const Text('data'),
        ),
      ],
    );
  }
}

mixin BottomSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      backgroundColor: Colors.amberAccent,
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return _CustomSheet(
          child: child,
        );
      },
    );
  }
}
