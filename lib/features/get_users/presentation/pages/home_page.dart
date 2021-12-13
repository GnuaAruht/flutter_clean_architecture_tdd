import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/presentation/widgets/user_list_error_widget.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/presentation/widgets/user_list_loading_widget.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/presentation/widgets/user_list_widget.dart';
import '../bloc/user_list_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Clean Architecture Demo'),
      ),
      body: Center(
        child: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            return state.when(
                initial: () => const Text("User List initial"),
                loading: () => const UserListLoadingWidget(),
                loaded: (userList) => UserListWidget(userList: userList),
                error: (errorMessage) => UserListErrorWidget(
                      errorMessage: errorMessage,
                    ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserListBloc>().add(const UserListEvent.loadUserList());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
