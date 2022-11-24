import 'dart:developer';

import 'package:flutter/material.dart';

class DialogLearnView extends StatefulWidget {
  const DialogLearnView({Key? key}) : super(key: key);

  @override
  State<DialogLearnView> createState() => _DialogLearnViewState();
}

class _DialogLearnViewState extends State<DialogLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // showAboutDialog(context: context, applicationName: 'Ömer', applicationVersion: '1.0');

        final response = await showDialog(
          // barrierDismissible: false, // force the barrier to be unclicklable
          context: context,
          builder: (context) {
            // return const Dialog(child: Text('data'));
            // return const AboutDialog();
            // return const _CustomAlert();
            // return UpdateDialog(context: context);
            return const ImageZoomDialog();
          },
        );
        inspect(response);
      }),
    );
  }
}

class _CustomAlert extends StatelessWidget {
  const _CustomAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version Update!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Update'),
        )
      ],
    );
  }
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text('Version Update!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Update'),
            )
          ],
        );
}

class ImageZoomDialog extends StatelessWidget {
  const ImageZoomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: SizedBox(
          child: Image.network('https://picsum.photos/300',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          )),
      ),
    );
  }
}