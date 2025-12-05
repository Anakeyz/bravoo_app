import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:bravoo_app/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// Countdown Timer Widget
class CountdownTimer extends StatefulWidget {
  final DateTime endTime;

  const CountdownTimer({
    super.key,
    required this.endTime,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemaining();
    });
  }

  void _updateRemaining() {
    setState(() {
      _remaining = widget.endTime.difference(DateTime.now());
      if (_remaining.isNegative) {
        _remaining = Duration.zero;
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildTimeBox(String value, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: AppColors.countdownBoxBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                value.padLeft(2, '0'),
                style: GoogleFonts.baloo2(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1,
                ),
              ),
              Text(
                label,
                style: GoogleFonts.manrope(
                  fontSize: 12.sp,
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = _remaining.inDays;
    final hours = _remaining.inHours.remainder(24);
    final minutes = _remaining.inMinutes.remainder(60);
    final seconds = _remaining.inSeconds.remainder(60);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeBox(days.toString(), 'Days'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            ':',
            style: GoogleFonts.manrope(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 0.8,
            ),
          ),
        ),
        _buildTimeBox(hours.toString(), 'Hours'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            ':',
            style: GoogleFonts.manrope(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 0.8,
            ),
          ),
        ),
        _buildTimeBox(minutes.toString(), 'Mins'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            ':',
            style: GoogleFonts.manrope(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 0.8,
            ),
          ),
        ),
        _buildTimeBox(seconds.toString(), 'Secs'),
      ],
    );
  }
}
