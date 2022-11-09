import 'package:flutter/material.dart';
import 'package:mail_example/backend.dart';
import 'package:mail_example/email.dart';
import 'package:mail_example/widgets/EmailWidget.dart';


class DetailScreen extends StatelessWidget {
 


  const DetailScreen({Key? key, required Email email}) : super(key: key);
 
  @override

  //obtenenemos el email
  Widget build(BuildContext context) {
    final Email email = ModalRoute.of(context)!.settings.arguments as Email;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock mail'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(email.from[0]),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      email.from,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email.subject,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(email.body),
              ),
            ),
          ),
        ],
      ),
    );
  }
}