import 'package:flutter/material.dart';
import 'package:portfolio_2024/tab_model.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  final List<TabModel> pages = const [];
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 1, child: ,),
                  Expanded(
                    flex: 1,
                    child: TabBar(
                      tabs: pages
                          .map((page) => TextButton.icon(
                                onPressed: () {
                                  tabController.animateTo(pages.indexOf(page),
                                      duration: const Duration(milliseconds: 300));
                                },
                                icon: page.icon,
                                label: Text(page.title),
                              ))
                          .toList(),
                    ),
                  ),
                  Expanded(flex: 1, child: FilledButton.icon(
                    icon: const Icon(Icons.email_outlined), label: const Text("Contattami"), onPressed: () {}
                  ),),
                ],
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              TabBarView(
                children: [
                  ...pages.map((page) => page.route),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }
}
