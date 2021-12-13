import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/entities/user.dart';

class UserListWidget extends StatelessWidget {
  final List<User> userList;
  const UserListWidget({Key? key, required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            leading: Text(user.id),
            title: Text(user.name),
          );
        });
  }
}
