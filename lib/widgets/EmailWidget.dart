// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mail_example/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;

    
  const EmailWidget({Key? key, required this.email}) : super(key: key);
   
  @override
/*•	En la pantalla principal los usuarios podrán observar una lista de emails, podrán tambien marcar como leido un email con un “Long Press”, o pueden eliminar un email con el gesto “swipe”.  */
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {//obtenenemos los datos por medio de la id
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreenPage(email: email),
          ),
        );
      },
      onLongPress: () {
        print('Long Press');
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          print('Dismissed');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.email),
                    const SizedBox(width: 10.0),
                   Text(email.from),
                    
                    Text(
                      email.subject,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email.body,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    email.dateTime.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (email.read)
                    const Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // ignore: non_constant_identifier_names
  DetailScreenPage({required Email email}) {

return Scaffold(
      appBar: AppBar(
        title: const Text('Funtional programming'),
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
      body: Container(
        padding: const EdgeInsets.all(16),
            
              margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
           //obtenenmos los datos del email
           Text('From: ${email.from}', style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 10),
            Container(
              //añadir un espacio entre los lados del texto
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Text('Subject: ${email.subject}')),
               Text('Body: ${email.body}'),
               const SizedBox(height: 10),
              Text('Date: ${email.dateTime}', style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 10),
           
          ],
        ),
      ),
    );


  }
 
}


