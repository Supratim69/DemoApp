import 'package:cryptic_hunt/Notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: const Color.fromARGB(255, 254, 244, 234)),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => QuestionProvider(),
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard), label: "Leaderboard")
            ],
          ),
          appBar: AppBar(
            title: Text("Current Phase Title"),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text("Question Title"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text("1000 points"),
                    )
                  ],
                ),
                Consumer<QuestionProvider>(
                  builder: (context, QuestionProvider, child) => Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            height: 50,
                            child: Text(
                                "Question No.- ${QuestionProvider.currentIndex + 1}"),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: QuestionProvider.firstBlood()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () =>
                                    QuestionProvider.previousQuestion(),
                                child: Icon(Icons.arrow_back_ios)),
                            SingleChildScrollView(
                              child: SizedBox(
                                height: 250,
                                width: 250,
                                child: Text(QuestionProvider.currentQuestion),
                              ),
                            ),
                            TextButton(
                                onPressed: () =>
                                    QuestionProvider.nextQuestion(),
                                child: Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter your answer here",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Text("or"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 15, right: 15),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 15, left: 10),
                                  child: Icon(Icons.qr_code_2_outlined),
                                ),
                                Text(
                                  "Scan QR Code",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
