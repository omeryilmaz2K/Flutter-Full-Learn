import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  _ModelLearnViewState createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  // final postModel = Post8();
  // var postModel = Post8();
  Post8 postModel = Post8(title: 'title');

  @override
  void initState() {
    super.initState();

    Post1 post = Post1();
    post.userId = 0;
    Post1 post1 = Post1()
      ..userId = 0
      ..id = 0
      ..title = ''
      ..body = '';

    Post2 post2 = Post2(0, 0, 'title', 'body');
    post2.body = '';

    Post3 post3 = Post3(0, 0, 'title', 'body');
    // post3.body = '';

    final post4 = Post4(userId: 0, id: 0, title: 'title', body: 'body');
    // post4.body = '';

    final post5 = Post5(userId: 0, id: 0, title: 'title', body: 'body');
    // post5. /// private
    post5.userId; // getter

    final post6 = Post6(userId: 0, id: 0, title: 'title', body: 'body');
    // post6. /// private
    post6.userId; // getter

    final post7 = Post7(body: 'body');
    // post7. /// private

    // Service
    final post8 = Post8();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(/* postModel.body! */ postModel.title ?? 'Not has any data'),
            Text(postModel.body ?? 'Not has any data'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // postModel.body = '';
        // postModel = Post8(body: 'body');
        setState(() {
          postModel = postModel.copyWith(body: 'body');
          postModel.setBody('update');
        });
      }),
    );
  }
}
