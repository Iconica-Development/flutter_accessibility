import "package:flutter/material.dart";
import "package:flutter_accessibility/flutter_accessibility.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: "Flutter Demo Home Page"),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    var groupColumn = Column(
      children: [
        CustomSemantics(
          identifier: "button",
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Button"),
          ),
        ),
        const CustomSemantics(
          identifier: "textfield",
          isTextField: true,
          child: TextField(
            decoration: InputDecoration(
              labelText: "Textfield",
            ),
          ),
        ),
        const CustomSemantics(
          identifier: "text",
          child: Text("Text"),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: SemanticsGroup(
          "main",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SemanticsGroup(
                "firstGroup",
                child: groupColumn,
              ),
              SemanticsGroup(
                "secondGroup",
                child: groupColumn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
