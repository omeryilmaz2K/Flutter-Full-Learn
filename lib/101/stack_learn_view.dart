import 'package:flutter/material.dart';

class StackLearnView extends StatelessWidget {
  const StackLearnView({Key? key}) : super(key: key);

  final String _title = 'Stack Learn';
  final double containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: containerHeight / 2),
                      child: Container(
                        color: Colors.purple,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.pink,
                            height: containerHeight,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    left: 50,
                                    right: 50,
                                    child: Container(
                                      color: Colors.amber,
                                    ))
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.yellow,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          color: Colors.black,
                          width: 50,
                          height: 50,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
