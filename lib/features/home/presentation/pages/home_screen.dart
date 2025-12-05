import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bravoo_app/core/constants/app_colors.dart';
import 'package:bravoo_app/core/constants/app_assets.dart';
import 'package:bravoo_app/core/widgets/elevated_button_3d.dart';
import 'package:bravoo_app/core/widgets/countdown_timer.dart';

/// Home Screen - Raffle draw with countdown timer and referral system
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final DateTime drawEndTime = DateTime.now().add(const Duration(days: 3, hours: 24));

  void _shareReferralLink() {
    const referralLink = 'https://Bravoo.ref12419';
    Share.share(
      'Join me on Bravoo and enter to win the Oraimo OpenSnap! $referralLink',
      subject: 'Join Bravoo',
    );
  }

  void _copyReferralLink() {
    const referralLink = 'https://Bravoo.ref12419';
    Clipboard.setData(const ClipboardData(text: referralLink));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Referral link copied!'),
        backgroundColor: AppColors.successGreen,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with flashlight effects
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryPurple,
            ),
            child: Stack(
              children: [
                // Flashlight effect image at top
                Positioned(
                  top: -200,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppAssets.flash,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                   Container(
                     decoration: const BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [
                           AppColors.primaryPurple,
                           AppColors.primaryPurple,
                           AppColors.purpleGradientStart,
                           AppColors.purpleGradientEnd,
                         ],
                       ),
                     ),
                     child: Column(
                       children: [
                         Gap(20.h),

                         // Header with back button
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             IconButton(
                               icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
                               onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                             ),
                             Expanded(
                               child: Text(
                                 'Enter to win the Oraimo\nOpenSnap!',
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.baloo2(
                                   fontSize: 24.sp,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white,
                                   height: 1.3,
                                 ),
                               ),
                             ),
                             Gap(48.w),
                           ],
                         ),

                         Gap(8.h),

                         // Product Stack - Box, Earbuds, and Details Container
                         Container(
                           height: 450.h, // Increased height to accommodate details
                           child: Stack(
                             alignment: Alignment.center,
                             children: [
                               // Box at bottom
                               Positioned(
                                 bottom: 100,
                                 child: Image.asset(
                                   AppAssets.box,
                                   width: 200.w,
                                   height: 200.h,
                                   fit: BoxFit.contain,
                                 ),
                               ),

                               // Earbuds sitting on box
                               Positioned(
                                 top: -20.h,
                                 child: Image.asset(
                                   AppAssets.earbuds,
                                   width: 200.w,
                                   height: 200.h,
                                   fit: BoxFit.contain,
                                 ),
                               ),

                               Positioned(
                                 top: 150.h,
                                 child: Opacity(
                                   opacity: 0.4,
                                   child: SvgPicture.asset(
                                     AppAssets.shadow,
                                     fit: BoxFit.contain,
                                   ),
                                 ),
                               ),

                               // Details container overlapping bottom of box
                               Positioned(
                                 bottom: 0,
                                 left: 0,
                                 right: 0,
                                 child: Container(
                                   margin: EdgeInsets.symmetric(
                                     horizontal: 15.w,
                                   ),
                                   padding: EdgeInsets.symmetric(
                                     horizontal: 20.w,
                                     vertical: 24.h,
                                   ),
                                   decoration: BoxDecoration(
                                     color: AppColors.primaryPurple,
                                     borderRadius: BorderRadius.only(
                                       topLeft: Radius.circular(16.r),
                                       topRight: Radius.circular(16.r),
                                     ),
                                   ),
                                   child: Column(
                                     children: [
                                       // Draw ends in text
                                       Text(
                                         'DRAW ENDS IN',
                                         style: TextStyle(
                                           fontSize: 12.sp,
                                           fontWeight: FontWeight.w700,
                                           color: Colors.white.withOpacity(0.7),
                                           letterSpacing: 1.2,
                                         ),
                                       ),
                                       Gap(12.h),
                                       // Countdown timer
                                       CountdownTimer(endTime: drawEndTime),
                                       Gap(20.h),
                                       // Users entered badge
                                       Container(
                                         padding: EdgeInsets.symmetric(
                                           horizontal: 24.w,
                                           vertical: 10.h,
                                         ),
                                         decoration: BoxDecoration(
                                           color: AppColors.countdownBg,
                                           borderRadius: BorderRadius.circular(20.r),
                                         ),
                                         child: Text(
                                           '4,327 USERS HAVE ENTERED SO FAR',
                                           style: GoogleFonts.baloo2(
                                             fontSize: 12.sp,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white.withOpacity(0.9),
                                             letterSpacing: 0.8,
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),

                    Divider(color: AppColors.qualificationCardBg, height: 0,),

                    // Qualification Card
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: AppColors.qualificationCardBg,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 8.r,
                            spreadRadius: 0,
                            offset: Offset(0, -2.h),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Gap(24.h),

                          // Icon
                          Image.asset(AppAssets.notification, width: 40.w, height: 40.h,),

                          Gap(16.h),

                          Text(
                            'QUALIFICATION RULE',
                            style: GoogleFonts.baloo2(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),

                          Gap(10.h),

                          Text(
                            'Invite at least 2 friends who sign up\nthrough your link to qualify.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                              fontSize: 12.sp,
                              color: Colors.white.withOpacity(0.7),
                              height: 1.4,
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.qualificationCardBg,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                              // borderRadius: BorderRadius.circular(20.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            margin: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
                            child: Column(
                              children: [

                                Gap(20.h),

                                // Invite Friends Button
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.r),
                                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                                  ),
                                  padding: EdgeInsets.all( 5.w),
                                  child: ElevatedButton3D(
                                    text: 'Invite Friends Now',
                                    onPressed: _shareReferralLink,
                                    width: double.infinity,
                                    height: 50.h,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    icon: Icons.person_add,
                                  ),
                                ),

                                Gap(16.h),

                                // Friend avatars
                                IntrinsicWidth(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.r),
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        _buildAvatar(AppAssets.user, filled: true),
                                        Container(
                                          height: 20.h,
                                          width: 1.w,
                                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        SvgPicture.asset(AppAssets.user1)
                                      ],
                                    ),
                                  ),
                                ),

                                Gap(12.h),

                                Text(
                                  'Once your second friend joins, you\'re\nautomatically entered.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.lightText,
                                    height: 1.3,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),

                                Divider(color: Colors.white.withOpacity(.2) ),

                                Gap(20.h),

                                // Invite friends section
                                Text(
                                  'Invite your friends quick & easy.',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(.6),
                                  ),
                                ),

                                Gap(16.h),

                                // Referral link
                                IntrinsicWidth(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 10.w
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.linkBg,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'https://Bravoo.ref.12419',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        Gap(10.w),

                                        InkWell(
                                          onTap: _copyReferralLink,
                                          child: SvgPicture.asset(AppAssets.copy)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Gap(20.h),

                                // Social buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildSocialButtonWithImage(
                                      AppAssets.whatsapp,
                                      'Whatsapp',
                                    ),
                                    _buildSocialButtonWithImage(
                                      AppAssets.twitter,
                                      'X (Twitter)',
                                    ),
                                    _buildSocialButtonWithImage(
                                      AppAssets.linkedin,
                                      'Linkedin',
                                    ),
                                  ],
                                ),

                                Gap(20.h),

                                // Referral count
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'You referred',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                        Gap(8.w),

                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white.withOpacity(0.7),
                                          size: 18.sp,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                       SvgPicture.asset(AppAssets.user2),
                                        Gap(8.w),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Gap(32.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Gap(10.h)

                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String? imagePath, {required bool filled}) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 2.w,
        ),
        color: filled ? Colors.white.withOpacity(0.2) : Colors.transparent,
      ),
      child: filled && imagePath != null
          ? ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            )
          : Icon(
              Icons.person_outline,
              color: Colors.white.withOpacity(0.5),
              size: 24.sp,
            ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return GestureDetector(
      onTap: _shareReferralLink,
      child: Container(
        width: 90.w,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.socialButtonBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 26.sp),
            Gap(6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButtonWithImage(String imagePath, String label) {
    return GestureDetector(
      onTap: _shareReferralLink,
      child: Container(
        width: 90.w,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.socialButtonBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, width: 26.sp, height: 26.sp, fit: BoxFit.contain),
            Gap(6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSvg(String? svgPath, {required bool filled}) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 2.w,
        ),
        color: filled ? Colors.white.withOpacity(0.2) : Colors.transparent,
      ),
      child: filled && svgPath != null
          ? ClipOval(
              child: SvgPicture.asset(
                svgPath,
                fit: BoxFit.cover,
              ),
            )
          : Icon(
              Icons.person_outline,
              color: Colors.white.withOpacity(0.5),
              size: 24.sp,
            ),
    );
  }
}
