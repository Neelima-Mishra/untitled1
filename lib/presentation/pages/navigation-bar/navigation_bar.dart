import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/di.dart';
import '../../../bloc/navigation/navigation_bloc.dart';
import '../../../bloc/navigation/navigation_event.dart';
import '../../../bloc/navigation/navigation_state.dart';
import '../../../resource/assets_manager.dart';
import '../../../resource/colors_manager.dart';
import '../../../resource/strings_manager.dart';
import '../../../resource/styles_manager.dart';
import '../../../resource/values_manager.dart';
import '../../common_component/common_image_assets.dart';
import '../list/list_page.dart';
import '../list/list_page_two.dart';
import '../list/list_pagr_three.dart';

class NavigationViewBar extends StatefulWidget {
  const NavigationViewBar({Key? key}) : super(key: key);

  @override
  State<NavigationViewBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationViewBar>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  TabController? tabController;
  final NavigationBloc _bloc = instance<NavigationBloc>();

  final PageController controller = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
            leading:const Icon(Icons.menu),
            automaticallyImplyLeading:false,
          bottom:const TabBar(
            tabs:  [
              Tab(icon: Icon(Icons.flight)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            ListPage(),
            ListPage(),
            ListPage(),
          ],
        ),
      ),
    );
  }
}
