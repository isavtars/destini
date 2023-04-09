import 'package:flutter/material.dart';

import 'strory_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StoryBrainP storybrain = StoryBrainP();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.png"))),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 12,
            child: Center(
                child: Text(
              storybrain.getStory(),
              style: TextStyle(color: Colors.white, fontSize: 15.0),
              textAlign: TextAlign.center,
            )),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    storybrain.nextStory(1);
                  });
                },
                child: Text(
                  storybrain.getChioce1(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Visibility(
              visible: storybrain.storyVisiable(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      storybrain.nextStory(2);
                    });
                  },
                  child: Text(
                    storybrain.getChioce2(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
