import 'package:flutter/material.dart';

class UserListErrorWidget extends StatelessWidget {
  final String errorMessage;
  const UserListErrorWidget({Key? key, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, color: Colors.red),
          const SizedBox(
            height: 10.0,
          ),
          Text(errorMessage)
        ],
      ),
    );
  }
}
