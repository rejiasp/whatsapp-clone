import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen/chat_detailscreen.dart';
import 'package:whatsapp/chat_screen/models/chat_model.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});
List<UserDetails> users=[
  UserDetails(image: "https://cdn.mos.cms.futurecdn.net/uzMGrKrxN467SmL4SFuEML-970-80.jpg.webp",name: "Rajeesh",message: "Hello Rajeesh", updatedAt: "11:25 AM",isGroup: true),
  UserDetails(image: "",name: "Rahees",message: "Hello Rahees", updatedAt: "12:25 AM",isGroup: true),
  UserDetails(image: "",name: "Flutter",message: "Hello Ahzam", updatedAt: "1:25 AM",isGroup: true),
  UserDetails(image: "https://cdn.mos.cms.futurecdn.net/uzMGrKrxN467SmL4SFuEML-970-80.jpg.webp",name: "Zainudheen",message: "Hello Zainudheen", updatedAt: "10:25 AM",isGroup: false),
  UserDetails(image: "https://cdn.mos.cms.futurecdn.net/uzMGrKrxN467SmL4SFuEML-970-80.jpg.webp",name: "Subaida",message: "Hello Subaida", updatedAt: "09:25 AM", isGroup: false),
  UserDetails(image: "",name: "Rubeena",message: "Hello Rubeena", updatedAt: "09:25 AM", isGroup: false)

  

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return  ListTile(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetail(data: users[index]),)),
            leading: CircleAvatar(
              backgroundImage:
              (users[index].image != "")?
              NetworkImage(
                users[index].image!
              ):

              NetworkImage(
                (users[index].isGroup!)?
                 "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png":
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                
              )
              //child: Text(users[index].name![0].toUpperCase()),
            ),
            title: Text(users[index].name!),
            subtitle: Text(users[index].message!),
            trailing: Text(users[index].updatedAt!)
            );
      },
    ));
  }
}
