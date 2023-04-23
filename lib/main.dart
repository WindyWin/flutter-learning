import 'package:flutter/material.dart';
import 'package:mvvm/ViewModels/Auth.dart';
import 'package:mvvm/ViewModels/UserProvider.dart';
import 'package:mvvm/presentation/Course/course_view.dart';
import 'package:mvvm/presentation/Login/login_view.dart';
import 'package:mvvm/presentation/Table/table_view.dart';
import 'package:provider/provider.dart';
import "./router/router.dart";

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      // ChangeNotifierProvider(create: (_) => LoginProvider())
      ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
        create: (_) => UserProvider(),
        update: (context, auth, pre) => pre!..update(auth),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF16C9C3),
          primary: const Color(0xFF74CCC9),
        ),
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
      routerConfig: router,
    );
    // (
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSwatch().copyWith(
    //       secondary: const Color(0xFF16C9C3),
    //       primary: const Color(0xFF74CCC9),
    //     ),
    //     cardTheme: CardTheme(
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10))),
    //   ),
    //   home: const Root(),
    //   routes: _router,
    // );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentPage = 0;
  List<Widget> views = const [LoginView(), CourseView(), TableView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Hello world"),
      // ),
      body: views[currentPage],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {debugPrint("home pressed")},
      //   child: const Icon(Icons.add),
      // ),
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
