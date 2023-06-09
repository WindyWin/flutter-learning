import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/presentation/LearnFlutter/learn_flutter_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const LearnFlutterView();
              }));
            },
            child: const Text("Learn flutter")));
  }
}
