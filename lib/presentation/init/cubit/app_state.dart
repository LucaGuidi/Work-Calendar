part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.isLoading = false,
  });

  final bool isLoading;

  AppState copyWith({
    bool? isLoading,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
      ];
}
