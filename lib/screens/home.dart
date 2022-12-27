import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/provider/demo_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key) {}

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CountProvider provider;

  @override
  void initState() {
    provider = Provider.of<CountProvider>(context, listen: false);
    provider.getSupervisorInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CountProvider>(
              builder: (context, value, child) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.supervisorInfo.length,
                      itemBuilder: (context, index) {
                        return Text(value.supervisorInfo[index]?.name ?? "");
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
