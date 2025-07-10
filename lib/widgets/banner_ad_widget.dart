// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_admob/models/ad_state_model.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../providers/ad_provider.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdProvider>(
      builder: (context, adProvider, child) {
        if (adProvider.adState.bannerAdState == AdLoadState.loaded &&
            adProvider.bannerAd != null) {
          return SizedBox(
            height: 50,
            child: AdWidget(ad: adProvider.bannerAd!),
          );
        }
        return Container(
          height: 50,
          color: Colors.grey[300],
          child: Center(
            child: Text(
              adProvider.adState.bannerAdState == AdLoadState.loading
                  ? 'Loading Ad...'
                  : 'Ad Failed to Load',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        );
      },
    );
  }
}
