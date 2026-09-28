import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/presentation/bottomnavigation/discover/view/gamedetail.dart';

// Project imports based on your structure
import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../home/view/homewidgets/background.dart';
import '../controllers/discovercontroller.dart';

class Discovergame extends StatefulWidget {
  const Discovergame({Key? key}) : super(key: key);

  @override
  State<Discovergame> createState() => _DiscovergameState();
}

class _DiscovergameState extends State<Discovergame> {
  @override
  Widget build(BuildContext context) {
    final DiscoverController controller = Get.put(DiscoverController(), permanent: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.height * 0.015),
        
                // 1. Search Bar & Filter Button Row
                _buildSearchBar(controller),
        
                SizedBox(height: AppSize.height * 0.02),
        
                // 2. Horizontal Filter Chips Scroll View
                _buildFilterChips(controller),
        
                SizedBox(height: AppSize.height * 0.025),
        
                // 3. Section Title: Games Near You
                Text(
                  'Games Near You',
                  style: TextStyle(
                    fontSize: AppSize.width * 0.04,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                ),
        
                SizedBox(height: AppSize.height * 0.02),
        
                // 4. Games Near You Cards List
                const _GameNearYouCard(
                  time: '9:00',
                  period: 'PM',
                  distance: '8.5 KM',
                  date: 'Thu, 23 May',
                  title: 'Jhon brown',
                  players: '18 - 20 Players',
                  code: '112',
                  tag: 'Tomorrow',
                ),
                SizedBox(height: AppSize.height * 0.012),
                const _GameNearYouCard(
                  time: '9:00',
                  period: 'PM',
                  distance: '8.5 KM',
                  date: 'Thu, 23 May',
                  title: 'Jhon brown',
                  players: '18 - 20 Players',
                  code: '112',
                  tag: 'Tomorrow',
                ),
                SizedBox(height: AppSize.height * 0.012),
                const _GameNearYouCard(
                  time: '9:00',
                  period: 'PM',
                  distance: '8.5 KM',
                  date: 'Thu, 23 May',
                  title: 'Jhon brown',
                  players: '18 - 20 Players',
                  code: '112',
                  tag: 'Tomorrow',
                ),
        
                SizedBox(height: AppSize.height * 0.03),
        
                // 5. Section Title: Looking for Players
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Looking for Players',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.038,
                        fontFamily: "ps",
                        fontWeight: FontWeight.bold,
                        color: AppColors.textcolor1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.035,
                          fontFamily: "ps",
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary1,
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: AppSize.height * 0.02),
        
                // 6. Looking for Players Card Item
                const _LookingForPlayersCard(
                  title: '4 Players Needed',
                  subtitle: 'Eun Thursday Footall',
                  locationTime: 'jalan bar stadium - 12:30 pm',
                  joinedText: '16 / 18',
                ),
        
                SizedBox(height: AppSize.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- Custom UI Helper Methods ----------------
  Widget _buildSearchBar(DiscoverController controller) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppSize.height * 0.055,
            decoration: BoxDecoration(
              color: AppColors.secondary1.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search location or game...',
                hintStyle: TextStyle(
                  fontSize: AppSize.width * 0.033,
                  fontFamily: "pr",
                  color: AppColors.textcolor2.withOpacity(0.6),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.textcolor2.withOpacity(0.6),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        SizedBox(width: AppSize.width * 0.03),
        Icon(
          Icons.filter_alt_outlined,
          size: AppSize.width * 0.075,
          color: AppColors.textcolor1,
        ),
      ],
    );
  }

  // Filter Chips Horizontal Scroll View Widget
  Widget _buildFilterChips(DiscoverController controller) {
    return SizedBox(
      height: AppSize.height * 0.042,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedCategoryIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectCategory(index),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width * 0.05,
                  vertical: AppSize.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary1
                      : AppColors.secondary1.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    controller.categories[index],
                    style: TextStyle(
                      fontSize: AppSize.width * 0.032,
                      fontFamily: isSelected ? "ps" : "pr",
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.w600,
                      color: isSelected
                          ? AppColors.background
                          : AppColors.textcolor1,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

// ---------------- Custom Extracted Widgets ----------------

// Extracted Widget 1: Games Near You Card
class _GameNearYouCard extends StatelessWidget {
  final String time;
  final String period;
  final String distance;
  final String date;
  final String title;
  final String players;
  final String code;
  final String tag;

  const _GameNearYouCard({
    Key? key,
    required this.time,
    required this.period,
    required this.distance,
    required this.date,
    required this.title,
    required this.players,
    required this.code,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.transparent,
        borderRadius: BorderRadius.circular(AppSize.height*0.012),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left Side Dark Purple Time Badge
            Container(
              width: AppSize.width * 0.2,
              padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.014),
              decoration: BoxDecoration(
                color: AppColors.primary1,
                borderRadius:  BorderRadius.circular(AppSize.height*0.012),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: AppSize.width * 0.05,
                      fontFamily: "ps",
                      fontWeight: FontWeight.bold,
                      color: AppColors.background,
                    ),
                  ),
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: AppSize.width * 0.032,
                      fontFamily: "ps",
                      fontWeight: FontWeight.bold,
                      color: AppColors.background,
                    ),
                  ),
                  SizedBox(height: AppSize.height * 0.02),
                  Text(
                    distance,
                    style: TextStyle(
                      fontSize: AppSize.width * 0.026,
                      fontFamily: "pr",
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Right Side Card Info
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppSize.width * 0.035),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Date & Tag Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: AppSize.width * 0.03,
                            fontFamily: "pr",
                            fontWeight: FontWeight.w700,
                            color: AppColors.textcolor2.withOpacity(0.7),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.width * 0.025,
                            vertical: AppSize.height * 0.004,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: AppSize.width * 0.025,
                              fontFamily: "ps",
                              color: AppColors.primary1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      title,
                      style: TextStyle(
                        fontSize: AppSize.width * 0.04,
                        fontFamily: "ps",
                        fontWeight: FontWeight.bold,
                        color: AppColors.textcolor1,
                      ),
                    ),

                    Text(
                      players,
                      style: TextStyle(
                        fontSize: AppSize.width * 0.028,
                        fontFamily: "pr",
                        fontWeight: FontWeight.w600,
                        color: AppColors.textcolor2.withOpacity(0.7),
                      ),
                    ),

                    // Code & Join Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          code,
                          style: TextStyle(
                            fontSize: AppSize.width * 0.035,
                            fontFamily: "ps",
                            fontWeight: FontWeight.bold,
                            color: AppColors.textcolor1,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(Gamedetail());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width * 0.05,
                              vertical: AppSize.height * 0.006,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary3,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Join',
                              style: TextStyle(
                                fontSize: AppSize.width * 0.03,
                                fontFamily: "ps",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extracted Widget 2: Looking For Players Card
class _LookingForPlayersCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String locationTime;
  final String joinedText;

  const _LookingForPlayersCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.locationTime,
    required this.joinedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.width * 0.035),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            Icons.sports_cricket_outlined,
            size: AppSize.width * 0.065,
            color: Colors.black87,
          ),
          SizedBox(width: AppSize.width * 0.03),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.036,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                ),
                 SizedBox(height: AppSize.height*0.005),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.03,
                    fontFamily: "pr",
                    fontWeight: FontWeight.w600,
                    color: AppColors.textcolor2.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: AppSize.height*0.005),
                Text(
                  locationTime,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.028,
                    fontFamily: "pr",
                    fontWeight: FontWeight.w500,
                    color: AppColors.textcolor2.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          Text(
            joinedText,
            style: TextStyle(
              fontSize: AppSize.width * 0.042,
              fontFamily: "ps",
              fontWeight: FontWeight.bold,
              color: AppColors.textcolor1,
            ),
          ),
        ],
      ),
    );
  }
}