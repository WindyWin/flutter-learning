import 'package:flutter/material.dart';
import 'package:mvvm/common-widget/snackbar.dart';
import 'package:mvvm/presentation/LearnFlutter/learn_flutter_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  LoadingSnackBar(
                      contentMessage: "loading...", timeout: 50000000),
                );
              },
              child: const Text("Show loading snackbar")),
          FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  ErrorSnackBar(
                      contentMessage: "error: fuck you", timeout: 500),
                );
              },
              child: const Text("Show error snackbar")),
          FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SuccessSnackBar(contentMessage: "success", timeout: 500),
                );
              },
              child: const Text("Show success snackbar")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const LearnFlutterView();
                }));
              },
              child: const Text("Learn flutter")),

        ],
      ),
    );
  }
}
