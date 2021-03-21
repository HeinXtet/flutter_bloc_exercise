import 'package:flutter/material.dart';
import 'package:flutter_tmdb/counter/counter.dart';
import 'package:flutter_tmdb/post/PostPage.dart';
import 'package:flutter_tmdb/timer/TimerPage.dart';

class ExampleModel {
  String title;
  Widget widget;

  ExampleModel({this.title, this.widget});
}

class App extends StatelessWidget {
  List<ExampleModel> example = [
    ExampleModel(
      title: "Counter Example",
      widget: CounterPage(),
    ),
    ExampleModel(
      title: "Timer Example",
      widget: TimerPage()
    ),
    ExampleModel(
        title: "Post Example",
        widget: PostPage()
    ),
  ];

  void handleOnExamplePressed(BuildContext context, ExampleModel exampleModel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => exampleModel.widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Bloc"),
      ),
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => handleOnExamplePressed(
            context,
            example[index],
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      example[index].title,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
