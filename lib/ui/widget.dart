import 'package:flutter/material.dart';
import 'package:latihan_getapi/model/user.dart';

class ListWidget extends StatelessWidget {
  final Datum listData;
  const ListWidget({super.key, required this.listData});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: Hero(
              tag: listData.avatar,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  listData.avatar,
                ),
              ),
            ),
            title: Text(
              "${listData.firstName} ${listData.lastName}",
            ),
            subtitle: Text(
              listData.email,
            )));
  }
}
