import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/chat_screen/models/call_model.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});
  List<Calls> msg = [
    Calls(
        name: "Rajeesh",
        isCall: true,
        isVideoCall: false,
        time: "10:AM",
        image:
            "https://cdn.mos.cms.futurecdn.net/uzMGrKrxN467SmL4SFuEML-970-80.jpg.webp"),
    Calls(
        name: "Rubeena",
        isCall: false,
        isVideoCall: true,
        time: "10:AM",
        image:
            "https://cdn.mos.cms.futurecdn.net/uzMGrKrxN467SmL4SFuEML-970-80.jpg.webp"),
    Calls(
        name: "Family",
        isCall: false,
        isVideoCall: true,
        time: "11:PM",
        image:
            "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png"),
    Calls(
        name: "Hathim nafz",
        isCall: true,
        isVideoCall: false,
        time: "09:AM",
        image:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
    Calls(
        name: "Zainudheen",
        isCall: true,
        isVideoCall: false,
        time: "8:30 AM",
        image:
            "https://cdn.mos.cms.futurecdn.net/uzMGrKrxN467SmL4SFuEML-970-80.jpg.webp"),
    Calls(
        name: "Subaida",
        isCall: false,
        isVideoCall: true,
        time: "04:00 PM",
        image: "")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: msg.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  (msg[index].image!),
                ),
              ),
              title: Text(msg[index].name!),
              subtitle: Row(
                children: [
                  (msg[index].isCall == true)
                      ? Icon(
                          Icons.call_received,
                          size: 15,
                        )
                      : Icon(
                          Icons.call_made,
                          size: 15,
                        ),
                  Text(msg[index].time!),
                ],
              ),
              trailing: (msg[index].isVideoCall == true)
                  ? Icon(Icons.video_call)
                  : Icon(Icons.call));
        },
      ),
    );
  }
}
