import 'package:flutter/material.dart';
import 'package:states_widgets_routes/models/languege.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Language> languages = [];

  Widget title = const Text("Minhas Linguagens");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 10,
            children: buildChoice(),
          ),
          Expanded(child: ListView(children: buildItemsList()))
        ],
      ),
    );
  }

  void _goToAddLanguage() {
    Future future = Navigator.pushNamed(context, "/add");
    future.then((languages) => setState(()
  }

  List<Widget> buildChoice() {
    return languages
        .map((l) => ChoiceChip(
            label: Text(l.title),
            selected: l.select,
            onSelected: (value) => setState(() {
                  l.select = value;
                })))
        .toList();
  }

  List<Widget> buildItemsList() {
    return languages
        .where((l) => l.select)
        .map((l) => Card(
              child: ListTile(
                leading: Icon(l.icon),
                title: Text(l.title),
                subtitle: Text(l.subTitle),
              ),
            ))
        .toList();
  }
}
