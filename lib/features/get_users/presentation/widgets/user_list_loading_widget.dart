import 'package:flutter/material.dart';

class UserListLoadingWidget extends StatelessWidget {
  const UserListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
    );
  }
}
