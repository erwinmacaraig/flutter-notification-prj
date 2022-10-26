import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, this.username, this.isMe,  { required this.keyy });

  final String message;  
  final bool isMe;
  final Key keyy;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),

          ),
          width: 180,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMe? Colors.black : Theme.of(context).textTheme.headline1!.color
                  ),
                ),
              Text(message, 
                style: TextStyle(
                  color: isMe? Colors.black : Theme.of(context).textTheme.headline1!.color),
                  textAlign: isMe ? TextAlign.end : TextAlign.start
              ),
            ],
          ),
        ),
      ],
    );
  }
}