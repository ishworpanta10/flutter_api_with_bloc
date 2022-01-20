import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper/dio_helper.dart';
import 'core/repository/repository.dart';
import 'core/routes/routes.dart';
import 'core/services/services.dart';
import 'cubits/api_service_cubit/service_cubits.dart';

Future<void> main() async {
  DioHelper.init();
  runApp(
    MyApp(
      apiRepository: ApiRepository(apiService: ApiService()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiRepository}) : super(key: key);
  final ApiRepository apiRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiRepository>(create: (context) => apiRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TechCrunchNewsFetchCubit>(
            create: (context) => TechCrunchNewsFetchCubit(apiRepository: apiRepository)..fetchTechCrunchNewsList(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Api Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
