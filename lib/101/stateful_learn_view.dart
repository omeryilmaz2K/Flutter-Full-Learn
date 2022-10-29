import 'package:flutter/material.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({Key? key}) : super(key: key);

  @override
  _CounterHelloButtonState createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  final String _title = 'Stateful Learn View';
  final String _visitorText = 'Merhaba ';
  int _visitorCounterValue = 0;

  void _vistorCounter() {
    _visitorCounterValue++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _vistorCounter,
        child: Text('$_visitorText $_visitorCounterValue'));
  }
}

class StatefulLearnView extends StatefulWidget {
  const StatefulLearnView({Key? key}) : super(key: key);

  @override
  _StatefulLearnViewState createState() => _StatefulLearnViewState();
}



class _StatefulLearnViewState extends State<StatefulLearnView> {
  final String _title = 'Stateful Learn View';
  int _counter = 0;
  final String _description =
      'Sayacı arttırmak için artı dügmesine, azaltmak için ise eksi dügmesine basınız...';

  void _counterFunction(bool isIncrease) {
    if (isIncrease) {
      _counter++;
      setState(() {});
    } else {
      _counter--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _counterText(),
          _descriptionText(context),
          const CounterHelloButton()
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _decreaseButton(),
        ],
      ),
    );
  }

  Center _counterText() {
    return Center(
      child: Text(
        _counter.toString(),
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Padding _descriptionText(BuildContext context) {
    return Padding(
      padding: UtilityPaddings.textPadding,
      child: Text(
        _description,
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () => _counterFunction(true),
      child: const Icon(Icons.add),
    );
  }

  Padding _decreaseButton() {
    return Padding(
        padding: UtilityPaddings.fABPadding,
        child: FloatingActionButton(
          onPressed: () => _counterFunction(false),
          child: const Icon(Icons.remove),
        ));
  }
}

class UtilityPaddings {
  static const textPadding = EdgeInsets.only(top: 10);
  static const fABPadding = EdgeInsets.only(left: 10);
}