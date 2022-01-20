import 'package:flutter/material.dart';
import 'package:flutter_api_test/core/repository/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositoryProvider.of<ApiRepository>(context).getAllTechCrunchNewsList();

    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
