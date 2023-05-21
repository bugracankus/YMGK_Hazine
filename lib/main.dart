import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoryScreen(),
    );
  }
}

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  bool showBackground = false;

  void startGame() {
    setState(() {
      showBackground = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.ibb.co/dc0p446/background1-removebg-preview-2.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          showBackground
              ? TestGame()
              : Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Bir gemi, uzak denizlerde yol alıyordu.',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 16),
                Text(
                  'Gemiye ait verileri doğru bir şekilde girerek hikayeyi devam ettirin.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: startGame,
                  child: Text('Oyuna Başla'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestGame extends StatefulWidget {
  @override
  _TestGameState createState() => _TestGameState();
}

class _TestGameState extends State<TestGame> {
  final TextEditingController inputControllerA = TextEditingController();
  final TextEditingController inputControllerB = TextEditingController();
  final TextEditingController inputControllerC = TextEditingController();
  final TextEditingController inputControllerD = TextEditingController();

  void checkInputs() {
    String a = inputControllerA.text;
    String b = inputControllerB.text;
    String c = inputControllerC.text;
    String d = inputControllerD.text;

    if (a == '45' && b == '60' && c == '55' && d == '120') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tebrikler!'),
            content: Text('Cevaplarınız doğru.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Uyarı'),
            content: Text('Lütfen cevaplarınızı kontrol ediniz.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    inputControllerA.dispose();
    inputControllerB.dispose();
    inputControllerC.dispose();
    inputControllerD.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.ibb.co/tPsmXBq/Whats-App-Image-2023-05-19-at-1-06-57-PM-1-1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: inputControllerA,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'a'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: inputControllerB,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'b'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: inputControllerC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'c'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: inputControllerD,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'd'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: checkInputs,
                child: Text('Kontrol Et'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
