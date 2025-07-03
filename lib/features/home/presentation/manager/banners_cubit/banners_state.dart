part of 'banners_cubit.dart';

sealed class BannersState {}

final class BannersInitial extends BannersState {}

class BannerChanged extends BannersState {
  final int currentIndex;

  BannerChanged(this.currentIndex);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerChanged && other.currentIndex == currentIndex;
  }

  @override
  int get hashCode => currentIndex.hashCode;
}
