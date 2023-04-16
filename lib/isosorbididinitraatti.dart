import 'package:flutter/material.dart';
import 'package:pilleripeli/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late PageController _pageController;
  late int selectedAnswer;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("categories")
          .doc("category1")
          .collection("medicines")
          .doc("medicine1")
          .collection("questions")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        List<DocumentSnapshot> questions = snapshot.data!.docs;
        return Scaffold(
          body: PageView.builder(
            itemCount: questions.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              DocumentSnapshot question = questions[index];
              return Column(
                children: [
                  Text(question['questionText']),
                  ElevatedButton(
                    child: Text(question['answer1']),
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 1;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text(question['answer2']),
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 2;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text(question['answer3']),
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 3;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text(question['answer4']),
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 4;
                      });
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
