import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://cdn.mos.cms.futurecdn.net/uzMGrKrxN467SmL4SFuEML-970-80.jpg.webp'),
          
        ),
        title: Text("My Status"),
            subtitle: Text("Tap to add status update"),
            
      )
    );
  }
}