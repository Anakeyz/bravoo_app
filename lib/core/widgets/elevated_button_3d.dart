import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonStyle3D {
  elevated3D,
  bottomBorder,
  plain,
}

class ElevatedButton3D extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;
  final bool isLoading;
  final IconData? icon;
  final String? svgIcon;
  final ButtonStyle3D buttonStyle;
  final bool hasBorder;
  final Color? borderColor;

  const ElevatedButton3D({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 56,
    this.isLoading = false,
    this.icon,
    this.svgIcon,
    this.buttonStyle = ButtonStyle3D.elevated3D,
    this.hasBorder = false,
    this.borderColor,
  });

  @override
  State<ElevatedButton3D> createState() => _ElevatedButton3DState();
}

class _ElevatedButton3DState extends State<ElevatedButton3D> {
  bool _isPressed = false;

  List<BoxShadow> _get3DShadows(Color backgroundColor) {
    // White buttons (Google/Apple) only get bottom shadow
    final isWhiteButton = backgroundColor == Colors.white;

    if (isWhiteButton) {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          offset: Offset(0, 2.h),
          blurRadius: 3.r,
          spreadRadius: 0,
        ),
      ];
    }

    if (_isPressed) {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: Offset(0, 7.h),
          blurRadius: 5.5.r,
          spreadRadius: 0,
        ),
      ];
    }

    return [
      // Layer 1
      BoxShadow(
        color: Colors.black.withOpacity(0.10),
        offset: Offset(0, 2.h),
        blurRadius: 4.r,
        spreadRadius: 0,
      ),
      // Layer 2
      BoxShadow(
        color: Colors.black.withOpacity(0.09),
        offset: Offset(0, 6.h),
        blurRadius: 6.r,
        spreadRadius: 0,
      ),
      // Layer 3
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0, 14.h),
        blurRadius: 9.r,
        spreadRadius: 0,
      ),
      // Layer 4
      BoxShadow(
        color: Colors.black.withOpacity(0.01),
        offset: Offset(0, 26.h),
        blurRadius: 10.r,
        spreadRadius: 0,
      ),
      // Layer 5
      BoxShadow(
        color: Colors.black.withOpacity(0.00),
        offset: Offset(0, 40.h),
        blurRadius: 11.r,
        spreadRadius: 0,
      ),
    ];
  }

  BoxDecoration _getDecoration(Color backgroundColor) {
    final borderColor = widget.borderColor ?? const Color(0x269013FE); // 15% opacity #9013FE
    final isWhiteButton = backgroundColor == Colors.white;

    switch (widget.buttonStyle) {
      case ButtonStyle3D.elevated3D:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          // White buttons don't get gradient
          gradient: isWhiteButton ? null : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              backgroundColor.withOpacity(0.7), // Top lighter
              backgroundColor,
              backgroundColor,
              backgroundColor,
            ],
          ),
          color: isWhiteButton ? backgroundColor : null,
          border: Border.all(color: borderColor, width: 1.w),
          boxShadow: _get3DShadows(backgroundColor),
        );

      case ButtonStyle3D.bottomBorder:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              backgroundColor,
            ],
            stops: const [0.0, 0.15],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(0, -1.h),
              blurRadius: 2.r,
              spreadRadius: 0,
            ),
            // Bottom shadows
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 4.h),
              blurRadius: 8.r,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: Offset(0, 2.h),
              blurRadius: 4.r,
              spreadRadius: 0,
            ),
          ],
        );

      case ButtonStyle3D.plain:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 1.w),
        );
    }
  }

  Widget _buildButtonContent(Color textColor) {
    return widget.isLoading
        ? SizedBox(
            width: 24.w,
            height: 24.h,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.svgIcon != null) ...[
                SvgPicture.asset(
                  widget.svgIcon!,
                  width: 20.sp,
                  height: 20.sp,
                ),
                SizedBox(width: 12.w),
              ] else if (widget.icon != null) ...[
                Icon(widget.icon, color: textColor, size: 20.sp),
                SizedBox(width: 12.w),
              ],
              Text(
                widget.text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundColor ?? const Color(0xFF111111);
    final textColor = widget.textColor ?? Colors.white;
    final isWhiteButton = backgroundColor == Colors.white;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        decoration: _getDecoration(backgroundColor),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.isLoading ? null : widget.onPressed,
            borderRadius: BorderRadius.circular(28.r),
            child: Stack(
              children: [
                // Left edge shadow effect - angled gradient (not for white buttons)
                if (widget.buttonStyle == ButtonStyle3D.elevated3D && !isWhiteButton)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.r),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withOpacity(0.15), // Left edge dark
                            Colors.black.withOpacity(0.08),
                            Colors.transparent,
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.08, 0.15, 1.0],
                        ),
                      ),
                    ),
                  ),
                // Right edge lighting effect - angled gradient (not for white buttons)
                if (widget.buttonStyle == ButtonStyle3D.elevated3D && !isWhiteButton)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.r),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.2), // Right edge bright
                          ],
                          stops: const [0.0, 0.85, 0.92, 1.0],
                        ),
                      ),
                    ),
                  ),
                // Bottom shadow angle for 3-angle elevation (not for white buttons)
                if (widget.buttonStyle == ButtonStyle3D.elevated3D && !isWhiteButton)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.12), // Bottom darker
                          ],
                          stops: const [0.0, 0.7, 0.88, 1.0],
                        ),
                      ),
                    ),
                  ),
                // Button content
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  alignment: Alignment.center,
                  child: _buildButtonContent(textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
