import 'package:flutter/material.dart';

class LearnFlutterView extends StatefulWidget {
  const LearnFlutterView({Key? key}) : super(key: key);

  @override
  _LearnFlutterViewState createState() => _LearnFlutterViewState();
}

class _LearnFlutterViewState extends State<LearnFlutterView> {
  bool isSwitch = true;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn flutter"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => {Navigator.of(context).pop()},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("info clicked");
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
              "https://arimotravels.com/wp-content/uploads/2021/03/random-drawing-generator-prompts.jpg.webp"),
          const SizedBox(
            height: 10,
          ),
          const Divider(color: Colors.green),
          Container(
            color: Colors.blueGrey,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(10, 11, 12, 13),
            child: const Center(
              child: Text(
                "This is a text Widget",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint("elevated button clicked");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.red : Colors.cyan,
              ),
              child: const Text("Elevated button")),
          OutlinedButton(
              onPressed: () {
                debugPrint("Outlined button clicked");
              },
              child: const Text("Outlined button")),
          TextButton(
              onPressed: () {
                debugPrint("Text button clicked");
              },
              child: const Text("Text button")),
          GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () => {debugPrint("Row clicked")},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.abc,
                  color: Colors.red,
                ),
                Icon(
                  Icons.dangerous,
                  color: Colors.green,
                ),
                Text("Row widget"),
                Icon(
                  Icons.ac_unit,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.access_alarm,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
          Switch(
              value: isSwitch,
              onChanged: (bool value) => {
                    setState(() {
                      isSwitch = value;
                    })
                  }),
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) => {
                    setState(() {
                      debugPrint(isChecked.toString());
                      isChecked = value;
                    })
                  }),
          Image.network(
              "https://arimotravels.com/wp-content/uploads/2021/03/random-drawing-generator-prompts.jpg.webp"),
        ]),
      ),
    );
  }
}
