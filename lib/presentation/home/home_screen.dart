import 'package:flutter/material.dart';
import 'widgets/home_slider.dart';
import 'widgets/service_grid.dart';
import 'widgets/offer_banner.dart';
import 'widgets/section_title.dart';
import 'widgets/plan_card_list.dart';
import 'widgets/request_card_list.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFF8FAFF);

    return Scaffold(
      backgroundColor: background,
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [

              HomeSlider(),
              SizedBox(height: 24),

              ServiceGrid(),
              SizedBox(height: 24),
              OfferBanner(),
              ///OfferBanner(imageUrl: apiBannerUrl),
              SizedBox(height: 24),
              SectionTitle(title: 'home.subscribe_save', action: 'home.view_all'),
              SizedBox(height: 10),
              PlanCardList(),
              SizedBox(height: 24),
              SectionTitle(title: 'home.request_once', action: 'home.view_all'),
              SizedBox(height: 10),
              RequestCardList(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
