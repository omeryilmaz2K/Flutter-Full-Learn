import 'package:flutter/material.dart';

class ListviewLearnView extends StatefulWidget {
  const ListviewLearnView({ Key? key }) : super(key: key);

  @override
  State<ListviewLearnView> createState() => _ListviewLearnViewState();
}

class _ListviewLearnViewState extends State<ListviewLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          FittedBox(child: Text('Merhaba', style: Theme.of(context).textTheme.headline1,)),
          Container(color: Colors.blue, height: 300,),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.amber, width: 300,),
                Container(color: Colors.white, width: 100,),
                Container(color: Colors.amber, width: 300,),
              ],
            ),
          ),
          const Icon(Icons.close),
          // xxx
          FittedBox(child: Text('Merhaba', style: Theme.of(context).textTheme.headline1,)),
          Container(color: Colors.blue, height: 300,),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.amber, width: 300,),
                Container(color: Colors.white, width: 100,),
                Container(color: Colors.amber, width: 300,),
              ],
            ),
          ),
          const Icon(Icons.close),
          const _Demo()
        ],
      ),
    );
  }
}

class _Demo extends StatefulWidget {
  const _Demo();

  @override
  State<_Demo> createState() => __DemoState();
}

class __DemoState extends State<_Demo> {
  @override
  void initState() {
    super.initState();
    print('draw');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}