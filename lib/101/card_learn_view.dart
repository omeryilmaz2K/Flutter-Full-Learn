import 'package:flutter/material.dart';

class CardLearnView extends StatelessWidget {
  const CardLearnView({Key? key}) : super(key: key);

  final String _title = 'Card Learn View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children:  const [
          _CenteredCardView(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(child: Text('data')),
            ),
          ),
          _CenteredCardView(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(child: Text('data')),
            ),
          ),
        ],
      ),
    );
  }
}

class _CenteredCardView extends StatelessWidget {
  const _CenteredCardView({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  // final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: ProjectMargins.cardMargin,
      // shape: ProjectMargins.roundedRectangleBorder,
      child: child,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
  static final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
}
