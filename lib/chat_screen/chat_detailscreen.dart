import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/chat_screen/chat_bubble.dart';
import 'package:whatsapp/chat_screen/models/chat_model.dart';
import 'package:whatsapp/chat_screen/models/message.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({super.key, required this.data});

  UserDetails data;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  TextEditingController messageController=TextEditingController();
  bool showSend = false;
  bool showEmoji = true;

  List<Messages> msg = [
    Messages(isSend: true, isReaded: true, message: "hello", sendAt: "10: Pm"),
    Messages(isSend: true, isReaded: true, message: "hello", sendAt: "10: Pm"),
    Messages(isSend: true, isReaded: true, message: "hello", sendAt: "10: Pm"),
    Messages(isSend: false, isReaded: false, message: "hi", sendAt: "9: Am"),
    Messages(isSend: false, isReaded: false, message: "hello", sendAt: "8: Am"),
    Messages(isSend: false, isReaded: false, message: "hello", sendAt: "8: Am"),
  ];
  ScrollController _scrollController= ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        titleSpacing: 5,
        leading: Row(
          children: [
            InkWell(
              child: const Padding(
                padding: EdgeInsets.only(left: 5, right: 3),
                child: Icon(Icons.arrow_back),
              ),
              onTap: () => Navigator.pop(context),
            ),
            CircleAvatar(
              backgroundImage:
                  //(users[index].image != "")?
                  NetworkImage(widget.data.image!),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.data.name!),
            Text(
              'Online',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: [
          Icon(Icons.video_call),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Text((widget.data.isGroup!)
                        ? "Group Info"
                        : "View Contact")),
                PopupMenuItem(
                    child: Text((widget.data.isGroup!)
                        ? "Group media"
                        : "Media, Links,and docs")),
                PopupMenuItem(child: Text("Search")),
                PopupMenuItem(child: Text("Mute Notification")),
                PopupMenuItem(child: Text("Disappering messages")),
                PopupMenuItem(child: Text("Wall papper")),
                PopupMenuItem(child: Text("More")),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/watsappbg.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          ListView.builder(
            controller: _scrollController,
            itemCount: msg.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                msges: msg[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: messageController,
                          onTap: () {
                            setState(() {
                              showEmoji=true;
                            });
                          },
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(
                                () {
                                  showSend = true;
                                },
                              );
                            } else {
                              setState(() {
                                showSend = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "message",
                            prefixIcon: IconButton(
                              onPressed: () {
                                if(showEmoji){
                                  FocusScope.of(context).unfocus();
                                }
                                setState(() {
                                  showEmoji = !showEmoji;
                                });
                              },
                              icon: Icon((showEmoji)
                                  ? Icons.emoji_emotions_outlined
                                  : Icons.keyboard),
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (builder) => menu(context));
                                    },
                                    icon: Icon(Icons.attach_file)),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.camera_alt),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        final time=DateFormat("hh:mma").format(DateTime.now(),);
                        print(messageController.text);
                        print(time);
                        setState(() {
                          msg.add(Messages(
                            isReaded: false,
                            isSend: true,
                            message: messageController.text,
                            sendAt: time,
                          ));
                        });
                        messageController.clear();
                      },
                      child: Icon((showSend) ? Icons.send : Icons.mic),
                    )
                  ],
                ),
                Offstage(offstage: showEmoji,
                child: SizedBox(
                  
                  height: 250,
                  child: EmojiPicker(
                    textEditingController: messageController,
                  ),
                ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container menu(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                  text: "Document",
                  icon: Icon(Icons.insert_drive_file),
                  color: Colors.purple,
                ),
                iconWidget(
                  text: "Camera",
                  icon: Icon(Icons.camera_alt),
                  color: Colors.red,
                ),
                iconWidget(
                  text: "Gallery",
                  icon: Icon(Icons.insert_photo),
                  color: Colors.deepPurple,
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: iconWidget(
                    text: "Audio",
                    icon: Icon(Icons.headphones),
                    color: Colors.orange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: iconWidget(
                    text: "Location",
                    icon: Icon(Icons.location_pin),
                    color: Colors.purple,
                  ),
                ),
                iconWidget(
                  text: "Contact",
                  icon: Icon(Icons.contact_phone),
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column iconWidget({String? text, Icon? icon, Color? color}) {
    return Column(
      children: [
        CircleAvatar(
          child: icon,
          backgroundColor: color,
          radius: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
