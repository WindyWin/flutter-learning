import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/Common/custom_app_bar.dart';
import 'package:mvvm/ViewModels/Auth.dart';
import 'package:mvvm/ViewModels/UserProvider.dart';
import 'package:provider/provider.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key, required this.child});
  final Widget child;
  @override
  State<ClientPage> createState() => _ClientPageState();
}

/// Representation of a tab item in the [ScaffoldWithBottomNavBar]
class ScaffoldWithNavBarTabItem extends NavigationDestination {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation,
      required Widget icon,
      required String label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}

class _ClientPageState extends State<ClientPage> {
  static const tabs = [
    ScaffoldWithNavBarTabItem(
      initialLocation: '/home',
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    ScaffoldWithNavBarTabItem(
      initialLocation: '/course',
      icon: Icon(Icons.school),
      label: 'Course',
    ),
    ScaffoldWithNavBarTabItem(
      initialLocation: '/table',
      icon: Icon(Icons.table_bar),
      label: 'Table',
    ),
  ];

  // getter that computes the current index from the current location,
  // using the helper method below
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(GoRouter.of(context).location),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ]),
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        destinations: tabs,
        onDestinationSelected: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
