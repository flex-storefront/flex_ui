import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// A customizable search input field widget.
///
/// Provides a text input field with search and clear icons, along with
/// configurable callbacks for text changes and submission.
class FlexSearch extends StatefulWidget {
  /// - [onChanged] Callback fired when search text changes
  /// - [onSubmitted] Callback fired when search is submitted
  /// - [onClearPressed] Callback fired when clear button is pressed, separate from text clearing functionality
  /// - [textInputAction] Keyboard action type, defaults to TextInputAction.search
  /// - [decoration] Optional custom input decoration that overrides all default styling
  /// - [controller] Optional external text controller for manual text management
  /// - [focusNode] Optional external focus node for manual focus management
  const FlexSearch({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.hintText = 'Search...',
    this.borderRadius = FlexSizes.borderRadiusMd,
    this.autofocus = true,
    this.enabled = true,
    this.clearButtonIcon,
    this.showClearButton = true,
    this.searchIcon,
    this.decoration,
    this.controller,
    this.focusNode,
    this.onClearPressed,
    this.textInputAction = TextInputAction.search,
    this.textStyle,
    this.inputFormatters,
  });

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onClearPressed;
  final TextInputAction textInputAction;
  final String hintText;
  final double borderRadius;
  final bool autofocus;
  final bool showClearButton;
  final Icon? clearButtonIcon;
  final Icon? searchIcon;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final bool enabled;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<FlexSearch> createState() => _FlexSearchState();
}

class _FlexSearchState extends State<FlexSearch> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isInternalController = false;
  bool _isInternalFocusNode = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _isInternalController = widget.controller == null;
    _isInternalFocusNode = widget.focusNode == null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, child) {
        return TextField(
          autofocus: widget.autofocus,
          controller: _controller,
          focusNode: _focusNode,
          decoration: widget.decoration ?? _buildDefaultDecoration(),
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          enabled: widget.enabled,
          style: widget.textStyle,
          inputFormatters: widget.inputFormatters,
        );
      },
    );
  }

  InputDecoration _buildDefaultDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: widget.textStyle,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showClearButton && _controller.text.isNotEmpty)
            IconButton(
              icon: widget.clearButtonIcon ?? const Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
                widget.onClearPressed?.call();
                widget.onChanged?.call('');
              },
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: widget.searchIcon ?? const Icon(Icons.search),
          ),
        ],
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
    );
  }

  @override
  void dispose() {
    if (_isInternalController) {
      _controller.dispose();
    }
    if (_isInternalFocusNode) {
      _focusNode.dispose();
    }
    super.dispose();
  }
}

@UseCase(
  name: 'Default',
  type: FlexSearch,
  path: '[Components]',
)
Widget flexSearchStandard(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlexSearch(
        autofocus: context.knobs.boolean(
          label: 'AutoFocus',
          initialValue: false,
        ),
        enabled: context.knobs.boolean(
          label: 'Enabled',
          initialValue: true,
        ),
        showClearButton: context.knobs.boolean(
          label: 'Show Clear Button',
          initialValue: true,
        ),
        hintText: context.knobs.string(
          label: 'Hint Text',
          initialValue: 'Search...',
        ),
        textStyle: TextStyle(
          color: context.knobs.list(
            label: 'Text Color',
            options: [
              Colors.black,
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
      ),
    ),
  );
}
