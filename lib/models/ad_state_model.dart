enum AdLoadState {
  loading,
  loaded,
  failed,
}

class AdState {
  final AdLoadState bannerAdState;
  final AdLoadState interstitialAdState;
  final AdLoadState rewardedAdState;
  final int rewardedAdPoints;

  AdState({
    this.bannerAdState = AdLoadState.loading,
    this.interstitialAdState = AdLoadState.loading,
    this.rewardedAdState = AdLoadState.loading,
    this.rewardedAdPoints = 0,
  });

  AdState copyWith({
    AdLoadState? bannerAdState,
    AdLoadState? interstitialAdState,
    AdLoadState? rewardedAdState,
    int? rewardedAdPoints,
  }) {
    return AdState(
      bannerAdState: bannerAdState ?? this.bannerAdState,
      interstitialAdState: interstitialAdState ?? this.interstitialAdState,
      rewardedAdState: rewardedAdState ?? this.rewardedAdState,
      rewardedAdPoints: rewardedAdPoints ?? this.rewardedAdPoints,
    );
  }
}
