import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int value) {
          return ListTile(
            title: Text("item ${value + 1}"),
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.delete),
            onTap: () => {debugPrint("item ${value + 1}")},
          );
        });
  }
}
