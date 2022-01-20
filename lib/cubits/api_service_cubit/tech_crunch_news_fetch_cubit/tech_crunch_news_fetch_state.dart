part of 'tech_crunch_news_fetch_cubit.dart';

enum TechCrunchNewsFetchStatus { initial, loading, loaded, error }

class TechCrunchNewsFetchState extends Equatable {
  final List<NewsModel> techCrunchNewsList;
  final Failure failure;
  final TechCrunchNewsFetchStatus status;

  /// Default constructor for [TechCrunchNewsFetchState]
  const TechCrunchNewsFetchState({
    required this.techCrunchNewsList,
    required this.status,
    required this.failure,
  });

  @override
  List<Object> get props => [techCrunchNewsList, failure, status];

  /// Initial factory constructor for [TechCrunchNewsFetchState] : cubit initial state
  factory TechCrunchNewsFetchState.initial() {
    return const TechCrunchNewsFetchState(
      techCrunchNewsList: [],
      status: TechCrunchNewsFetchStatus.initial,
      failure: Failure(),
    );
  }

  /// copy with method for [TechCrunchNewsFetchState]

  TechCrunchNewsFetchState copyWith({
    List<NewsModel>? techCrunchNewsList,
    Failure? failure,
    TechCrunchNewsFetchStatus? status,
  }) {
    return TechCrunchNewsFetchState(
      techCrunchNewsList: techCrunchNewsList ?? this.techCrunchNewsList,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }
}
