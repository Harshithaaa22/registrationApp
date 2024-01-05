import 'package:flutter/material.dart';
class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("registered"),),
      body: Column(children: [
        Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage("https://img.freepik.com/premium-vector/thumbs-up-emoji-with-big-eyes-open-mouth_1319-995.jpg?w=360"),
          ),
        ),
      ),
      SizedBox(height: 50,
      ),
      Text("Registration Successful!!!",style: TextStyle(fontSize: 30),),
      
      ],
      ),
      ); 
  }
}