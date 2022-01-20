import 'package:flutter/material.dart';
import 'package:flutter_api_test/cubits/api_service_cubit/service_cubits.dart';
import 'package:flutter_api_test/models/models.dart';
import 'package:flutter_api_test/screens/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recent Tech Crunch News')),
      body: BlocBuilder<TechCrunchNewsFetchCubit, TechCrunchNewsFetchState>(
        builder: (context, techCrunchApiState) {
          return _buildBody(context, techCrunchApiState);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, TechCrunchNewsFetchState techCrunchApiState) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    switch (techCrunchApiState.status) {
      case TechCrunchNewsFetchStatus.loading:
        return const CustomLoadingWidget();

      case TechCrunchNewsFetchStatus.error:
        return CustomErrorWidget(error: techCrunchApiState.failure.message);

      case TechCrunchNewsFetchStatus.loaded:
        final List<NewsModel> newsList = techCrunchApiState.techCrunchNewsList;
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.01, vertical: deviceHeight * 0.02),
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final NewsModel newsModel = newsList[index];
            return SingleNewsTileWidget(newsModel: newsModel);
          },
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
