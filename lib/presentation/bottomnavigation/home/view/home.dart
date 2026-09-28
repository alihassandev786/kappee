import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/core/widgets/button.dart';

// Project imports based on your structure
import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../controllers/homecontroller.dart';
import 'homewidgets/background.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.height * 0.015),

              // 1. Top Header Row (Logo & Notification Icon)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    height: AppSize.height * 0.045,
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: AppColors.background,
                    size: AppSize.height * 0.04,
                  ),
                ],
              ),

              SizedBox(height: AppSize.height * 0.015),

              // 2. User Greeting Section & Profile Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.greeting.value,
                          style: TextStyle(
                            fontSize: AppSize.width * 0.04,
                            fontFamily: "pr",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.userName.value,
                              style: TextStyle(
                                fontSize: AppSize.width * 0.065,
                                fontFamily: "ps",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSize.height * 0.01),
                          Text(
                            '👋',
                            style: TextStyle(fontSize: AppSize.width * 0.055),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: AppSize.width * 0.065,
                    backgroundColor: Colors.white24,
                    backgroundImage: const AssetImage(
                      'assets/images/profile.png',
                    ),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: AppSize.height * 0.015),

              // 3. Section Title: Your Next Game
              Text(
                'Your Next Game',
                style: TextStyle(
                  fontSize: AppSize.width * 0.035,
                  fontFamily: "pr",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: AppSize.height * 0.012),

              // 4. Next Game Main White Card
              const _NextGameCard(),

              SizedBox(height: AppSize.height * 0.02),

              // 5. Need More Players Banner Card
              const _NeedMorePlayersCard(),

              SizedBox(height: AppSize.height * 0.025),

              // 6. Active Games Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Games',
                    style: TextStyle(
                      fontSize: AppSize.width * 0.042,
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

              SizedBox(height: AppSize.height * 0.015),

              // 7. Active Games List
              const _ActiveGameItem(
                title: 'Eo- 20 May - 8:30 PM',
                subtitle: 'Jalan besar stadium',
                joinedText: '16 / 18',
              ),
              SizedBox(height: AppSize.height * 0.012),
              const _ActiveGameItem(
                title: 'Eo- 20 May - 8:30 PM',
                subtitle: 'Jalan besar stadium',
                joinedText: '16 / 18',
              ),

              SizedBox(height: AppSize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

// Extracted Widget 1: Next Game Card
class _NextGameCard extends StatelessWidget {
  const _NextGameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.width * 0.07),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Status Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Thursday Football',
                    style: TextStyle(
                      fontSize: AppSize.width * 0.042,
                      fontFamily: "ps",
                      fontWeight: FontWeight.bold,
                      color: AppColors.textcolor1,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text('⚽'),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width * 0.03,
                  vertical: AppSize.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary3,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    fontSize: AppSize.width * 0.025,
                    fontFamily: "pm",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.height * 0.005),

          // Location & Date Time
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: AppSize.width * 0.038,
                color: AppColors.textcolor2.withOpacity(0.7),
              ),
              const SizedBox(width: 4),
              Text(
                'Jalan Besar Stadium',
                style: TextStyle(
                  fontSize: AppSize.width * 0.032,
                  fontFamily: "pr",
                  fontWeight: FontWeight.w700,
                  color: AppColors.textcolor2.withOpacity(0.7),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.height * 0.005),
          Text(
            'Thu,26 Oct - 8:00 PM',
            style: TextStyle(
              fontSize: AppSize.width * 0.03,
              fontFamily: "pr",
              fontWeight: FontWeight.w700,
              color: AppColors.textcolor2.withOpacity(0.7),
            ),
          ),

          SizedBox(height: AppSize.height * 0.02),

          // Player Count & View Game Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '16 ',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.05,
                        fontFamily: "ps",
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary1,
                      ),
                      children: [
                        TextSpan(
                          text: '/ 18',
                          style: TextStyle(
                            fontSize: AppSize.width * 0.04,
                            fontFamily: "ps",
                            color: AppColors.primary1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Players Joined',
                    style: TextStyle(
                      fontSize: AppSize.width * 0.026,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textcolor2.withOpacity(0.7),
                      fontFamily: "pr",
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width * 0.05,
                    vertical: AppSize.height * 0.008,
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'View Game',
                  style: TextStyle(
                    fontSize: AppSize.width * 0.03,
                    fontFamily: "ps",
                    color: AppColors.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.height * 0.015),

          // Status Dots Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusDot(Colors.green, '13 Paid'),
              _buildStatusDot(AppColors.primary3, '3 Pending'),
              _buildStatusDot(Colors.redAccent, 'removed'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDot(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: AppSize.width * 0.028,
            fontFamily: "pr",
            fontWeight: FontWeight.w700,
            color: AppColors.textcolor2.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

// Extracted Widget 2: Need More Players Banner
class _NeedMorePlayersCard extends StatelessWidget {
  const _NeedMorePlayersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width * 0.07,
        vertical: AppSize.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E7), // Light Cream Yellow Background
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need More Players?',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.04,
                        fontFamily: "ps",
                        fontWeight: FontWeight.bold,
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.height * 0.006),
                    Text(
                      'Lets connect with the player\nusing the link',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.03,
                        fontFamily: "pr",
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSize.height * 0.014),
                decoration: BoxDecoration(
                  color: AppColors.primary1,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.group_add_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.height * 0.02),
          Container(
            padding: EdgeInsets.symmetric(vertical: AppSize.height*0.009,horizontal: AppSize.height*0.012),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.height*0.01),
              color: AppColors.primary3
            ),
            child: Text("Find Player",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "ps",
              fontSize: AppSize.height*0.014
            ),),
          ),

        ],
      ),
    );
  }
}

// Extracted Widget 3: Active Game List Tile
class _ActiveGameItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String joinedText;

  const _ActiveGameItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.joinedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width * 0.035,
        vertical: AppSize.height * 0.012,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            Icons.sports_cricket_outlined,
            size: AppSize.width * 0.06,
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
                    fontSize: AppSize.width * 0.034,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.03,
                    fontFamily: "pr",
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Text(
            joinedText,
            style: TextStyle(
              fontSize: AppSize.width * 0.04,
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
