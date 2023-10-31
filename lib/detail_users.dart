import 'package:flutter/material.dart';
import 'package:http_request/users_model.dart';

class  DetailUsers extends StatelessWidget {
  final Data userData;
  const DetailUsers ({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text('Detail User'),
        backgroundColor: Colors.purple,
    ),

    body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.network(userData.avatar!),
           Container(
             width: 30,
           ),
           Text(userData.firstName!+" "+userData.lastName!),
           Text(userData.email!),
         ],
       ),
      ),
    );
  }
}
