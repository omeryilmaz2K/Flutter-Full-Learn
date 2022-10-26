import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          TextButton(onPressed: null, child: Text("data")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, shape: CircleBorder()),
              onPressed: () {},
              child: Text(
                "data",
                style: Theme.of(context).textTheme.button,
              )),
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarms),
              label: Text("Alarm")),
          IconButton(onPressed: () {}, icon: Icon(Icons.chair)),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "data",
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) return Colors.blue;
              return Colors.white;
            })),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
                height: 50, width: 100, child: Center(child: Text("data"))),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                        child: Text(
                          "Place Bid",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: Colors.white),
                        ),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Borders
// CircleBorder(), RoundedRectangleBorder(), OutlinedBorder(), StadiumBorder()