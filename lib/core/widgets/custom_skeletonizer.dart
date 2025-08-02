import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizer extends StatelessWidget {
  const CustomSkeletonizer(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: child,
    );
  }
}
