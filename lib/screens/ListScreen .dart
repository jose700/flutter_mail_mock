

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mail_example/backend.dart';
import 'package:mail_example/widgets/EmailWidget.dart';

class ListScreen extends StatelessWidget {
     final Backend _backend;
   /*    Backend().getEmails(); */
  const ListScreen({Key? key, required Backend backend}) : _backend = backend, super(key: key);

  @override

  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
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
      /*getEmails*/
      body:ListView(
        //recorrer la lista de emails del EmailWidget por medio de un map
        children: _backend.getEmails().map((email) => EmailWidget(email: email)).toList(),
      ),
    );
  }

}