import 'package:flutter/material.dart';
import 'package:whatsapp/Camera_Screen/camera.dart';
import 'package:whatsapp/call_screen/call_screen.dart';
import 'package:whatsapp/chat_screen/chat_screen.dart';
import 'package:whatsapp/status_screen/status_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title:const Text('whatsapp'),
          actions: [
            const Icon(Icons.search),
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('New Group')),
                const PopupMenuItem(child: Text('New Broad Cast')),
                const PopupMenuItem(child: Text('Linked Device')),
              ];
            })
          ],
          bottom: const TabBar(tabs: [
            Icon(Icons.camera_alt),
            Text('CHAT'),
            Text('STATUS'),
            Text('CALLS')
          ]),
        ),
        body:  TabBarView(
          children: [
            CameraScreen(),
            ChatScreen(),
            StatusPage(),
            CallScreen()
          ],
        ),
      ),
    );
  }
}
