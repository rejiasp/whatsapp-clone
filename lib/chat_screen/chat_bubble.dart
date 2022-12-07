
import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen/models/message.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({
    Key? key,required this.msges
  }) : super(key: key);
Messages msges;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:(msges.isSend!)?Alignment.centerRight: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 150),
            child: Card(color: (msges.isSend!)? Color(0xffdcf8c6):Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 30,
                    top: 10,
                    bottom: 15,
                  ),
                  child: Text(msges.message!),
                  
                ),
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: Row(
                    children: [
                      Text(msges.sendAt!,style: TextStyle(fontSize: 10),),
                      (msges.isSend!)?
                      Icon(Icons.done_all,size: 10,color: (msges.isReaded!)?Colors.blue:Colors.grey,):SizedBox()
                      
                    ],
                  ),
                ),

              ],
            )
            ),
            ),
            
      
    );
  }
}