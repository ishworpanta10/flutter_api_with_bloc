import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/core/repository/repository.dart';
import 'package:flutter_api_test/models/models.dart';

part 'tech_crunch_news_fetch_state.dart';

class TechCrunchNewsFetchCubit extends Cubit<TechCrunchNewsFetchState> {
  final ApiRepository _apiRepository;

  TechCrunchNewsFetchCubit({
    required ApiRepository apiRepository,
  })  : _apiRepository = apiRepository,
        super(TechCrunchNewsFetchState.initial());

  Future<void> fetchTechCrunchNewsList() async {
    emit(state.copyWith(status: TechCrunchNewsFetchStatus.loading));
    try {
      final newsDataList = await _apiRepository.getAllTechCrunchNewsList();
      emit(state.copyWith(status: TechCrunchNewsFetchStatus.loaded, techCrunchNewsList: newsDataList));
    } on Failure catch (failure) {
      emit(state.copyWith(status: TechCrunchNewsFetchStatus.error, failure: failure));
      debugPrint('Failure during fetch api news cubit () :${failure.message}');
    } catch (err) {
      emit(state.copyWith(status: TechCrunchNewsFetchStatus.error, failure: Failure(message: err.toString())));
      debugPrint('Error during fetch api news cubit () :$err');
    }
  }
}
