import 'package:flutter/material.dart';
import 'package:mvvm/presentation/Home/home_view.dart';
import 'package:mvvm/presentation/Profile/profile_view.dart';
import 'package:mvvm/presentation/Table/table_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentPage = 0;
  List<Widget> views = const [
    HomeView(),
    TableView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello world"),
      ),
      body: views[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () => {debugPrint("home pressed")},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.table_chart), label: "table"),
          NavigationDestination(icon: Icon(Icons.person), label: "profile"),
        ],
        onDestinationSelected: (int index) => {
          setState(() {
            currentPage = index;
          })
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
