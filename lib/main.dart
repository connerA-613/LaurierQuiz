import 'package:flutter/material.dart';

import './Quiz.dart';
import './Result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

  class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
    'questionText': 'Q1. What is your ideal distance from campus?',
    'answers': [
    {'text': '5 minute walk or less', 'letter': 'A'},
    {'text': '10 minute walk or less', 'letter': 'BC'},
    {'text': '15 minute walk or less', 'letter': 'CD'},
    {'text': '20 minute walk or less', 'letter': 'DE'},
    ],
    },
    {
      'questionText': 'Q2. What mode of transportation do you think you take most often?',
      'answers': [
        {'text': 'Walking', 'letter': 'AC'},
        {'text': 'City Transportation', 'letter': 'BC'},
        {'text': 'My Car', 'letter': 'D'},
        ],
    },
    {
    'questionText': 'Q3. How often do you plan on getting groceries?',
    'answers': [
    {'text': 'Weekly', 'letter': 'AE'},
    {'text': 'Bi-Weekly', 'letter': 'BC'},
    {'text': 'Monthly', 'letter': 'D'},
    {'text': 'Whenever my Roommates Going', 'letter': 'BD'},
    ],
    },
  {
  'questionText': 'Q4. Looking for security? How much?',
  'answers': [
  {'text': 'Security Cameras / Doorbell Camera is fine with me!', 'letter': 'BCD'},
  {'text': 'Emergency On-Call Contact with Property Manager', 'letter': 'ABC'},
  {'text': 'Security/Reception during the Day', 'letter': 'AE'},
  {'text': '24 Hour Security', 'letter': 'A'},
  ],
  },
  {
  'questionText': 'Q5. How advanced are your cooking skills? (Refridgerator included)',
  'answers': [
  {'text': 'Microwave, Stove, Dishwasher are a Must', 'letter': 'AE'},
  {'text': 'Stove & Microwave, I dont mind washing dishes', 'letter': 'ABDE'},
  {'text': 'I can get by with just a stove!', 'letter': 'BCD'},
  {'text': 'As long as I have somewhere to plug in my air-fryer, I am good to go!', 'letter': 'AE'},
  ],
  },
  {
  'questionText': 'Q6. What are your laundry expectations?',
  'answers': [
  {'text': 'in-unit Laundry, I dont really want to share.', 'letter': 'AE'},
  {'text': 'Communal Laundry (either with roommates or the rest of your building...)', 'letter': 'ABDE'},
  {'text': 'Where is the nearest laundromat?!', 'letter': 'BCD'},
  {'text': 'Wait, my parents wont be doing my laundry anymore?', 'letter': 'AE'},
  ],
  },
  {
  'questionText': 'Q7. Furniture included? Yes please, or no thank you?',
  'answers': [
  {'text': 'Everything included and yes, im willing to pay extra!', 'letter': 'AE'},
  {'text': 'A couch for the living room would be ideas, but I can bring my own bed', 'letter': 'ABDE'},
  {'text': 'Nothing for me! I want an empty space!', 'letter': 'C'},
  {'text': 'Facebook marketplace is kind of my thing... id take a mixture of both', 'letter': 'BD'},
  ],
  },
  {
  'questionText': 'Q8. Bathroom sharing? You in or are you out?',
  'answers': [
  {'text': 'En-Suite only. No exceptions.', 'letter': 'BCD'},
  {'text': 'im fine sharing with 1 or 2 people...', 'letter': 'ABDE'},
  {'text': '1 bathroom?! I will start making a schedule now.', 'letter': 'BCD'},
  ],
  },
  {
  'questionText': 'Q9. Need parking?',
  'answers': [
  {'text': 'yes and would prefer shared undergound/indoor', 'letter': 'AE'},
  {'text': 'Yes and definitely with my own spot', 'letter': 'C'},
  {'text': 'Yes but dont particularly care where!', 'letter': 'C'},
  {'text': 'Nope, city transit for me.', 'letter': 'BC'},
  ],
  },
  ];

  var _questionIndex = 0;
  var numA = 0;
  var numB = 0;
  var numC = 0;
  var numD = 0;
  var numE = 0;
  var result = '';

  void _resetQuiz() {
  setState(() {
  _questionIndex = 0;
  numA = 0;
  numB = 0;
  numC = 0;
  numD = 0;
  numE = 0;
  });
  }

  void _answerQuestion(String ans) {
  if (ans.contains('A')) {
  numA += 1;
  } if (ans.contains('B')) {
  numB += 1;
  } if (ans.contains('C')) {
  numC += 1;
  } if (ans.contains('D')) {
  numD += 1;
  } if (ans.contains('E')) {
  numE += 1;
  }
  setState(() {
  _questionIndex = _questionIndex + 1;
  });
  }
  String _returnResult() {
    final numbers = <int>[numA, numB, numC, numD, numE];
    numbers.sort();
    if (numbers[4] == numA) {
      return 'A';
    } else if (numbers[4] == numB) {
      return 'B';
    } else if (numbers[4] == numC) {
      return 'C';
    } else if (numbers[4] == numD) {
      return 'D';
    } else {
      return 'E';
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
  // This is the theme of your application.
  //
  // Try running your application with "flutter run". You'll see the
  // application has a blue toolbar. Then, without quitting the app, try
  // changing the primarySwatch below to Colors.green and then invoke
  // "hot reload" (press "r" in the console where you ran "flutter run",
  // or simply save your changes to "hot reload" in a Flutter IDE).
  // Notice that the counter didn't reset back to zero; the application
  // is not restarted.
  primarySwatch: Colors.blue,
  ),
  home: Scaffold(
  appBar: AppBar(
  title: const Text('Laurier Off Campus Housing Lifestyle Quiz'),
  backgroundColor: Colors.purple,
  ),
  body: Container(
  padding: const EdgeInsets.all(200.0),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://grantme.ca/wp-content/uploads/2021/10/quad-banner.jpeg'),
    fit: BoxFit.cover,
    ),
    ),
  child: _questionIndex < _questions.length
  ? Quiz(
  answerQuestion: _answerQuestion,
  questionIndex: _questionIndex,
  questions: _questions,
  ) //Quiz
      : Result(_returnResult(), _resetQuiz),
  ), //Padding
  ), //Scaffold
  debugShowCheckedModeBanner: false,
  ); //MaterialApp
  }
  }


