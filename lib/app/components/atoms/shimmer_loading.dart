import 'package:flutter/material.dart';
import '../elements/shimmer.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.child,
    this.isLoading,
  });

  final Widget child;
  final bool? isLoading;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = CustomShimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading ?? (CustomShimmer.of(context)?.isLoading ?? false)) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _isLoading =
        widget.isLoading ?? (CustomShimmer.of(context)?.isLoading ?? false);
    if (!_isLoading) {
      return widget.child;
    }

    final shimmer = CustomShimmer.of(context)!;

    if (!shimmer.isSized) {
      return const SizedBox();
    }

    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(
        descendant: context.findRenderObject() as RenderBox);

    return AbsorbPointer(
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) {
          return gradient.createShader(Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ));
        },
        child: widget.child,
      ),
    );
  }
}
