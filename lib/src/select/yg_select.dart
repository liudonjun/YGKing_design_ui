import 'package:flutter/material.dart';

class YGSelectOption {
  final String value;
  final String label;
  final bool disabled;

  const YGSelectOption({
    required this.value,
    required this.label,
    this.disabled = false,
  });
}

class YGSelect extends StatefulWidget {
  final List<YGSelectOption> options;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final String? placeholder;
  final bool disabled;
  final bool clearable;
  final bool searchable;
  final double? width;
  final double? maxHeight;

  const YGSelect({
    Key? key,
    required this.options,
    this.value,
    this.onChanged,
    this.placeholder,
    this.disabled = false,
    this.clearable = false,
    this.searchable = false,
    this.width,
    this.maxHeight,
  }) : super(key: key);

  @override
  State<YGSelect> createState() => _YGSelectState();
}

class _YGSelectState extends State<YGSelect> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && !widget.searchable) {
        _hideOverlay();
      }
    });
  }

  @override
  void dispose() {
    _hideOverlay();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showOverlay() {
    if (_overlayEntry != null || widget.disabled) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 4.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(4),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: widget.maxHeight ?? 300,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildOptions(),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  List<Widget> _buildOptions() {
    final String searchText = _searchController.text.toLowerCase();
    return widget.options
        .where((option) =>
            !widget.searchable ||
            option.label.toLowerCase().contains(searchText))
        .map((option) => InkWell(
              onTap: option.disabled
                  ? null
                  : () {
                      widget.onChanged?.call(option.value);
                      _hideOverlay();
                      _searchController.clear();
                    },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                color: widget.value == option.value
                    ? const Color(0xFFE6F7FF)
                    : null,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        option.label,
                        style: TextStyle(
                          color: option.disabled
                              ? Colors.grey
                              : widget.value == option.value
                                  ? const Color(0xFF1890FF)
                                  : Colors.black87,
                        ),
                      ),
                    ),
                    if (widget.value == option.value)
                      const Icon(
                        Icons.check,
                        size: 16,
                        color: Color(0xFF1890FF),
                      ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedOption = widget.options.firstWhere(
        (option) => option.value == widget.value,
        orElse: () => YGSelectOption(value: '', label: ''));

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          if (_isOpen) {
            _hideOverlay();
          } else {
            _showOverlay();
          }
        },
        child: Container(
          width: widget.width,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  _isOpen ? const Color(0xFF1890FF) : const Color(0xFFD9D9D9),
            ),
            borderRadius: BorderRadius.circular(4),
            color: widget.disabled ? const Color(0xFFF5F5F5) : Colors.white,
          ),
          child: Row(
            children: [
              if (widget.searchable)
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.placeholder ?? '请选择',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onTap: _showOverlay,
                    onChanged: (_) => setState(() {}),
                  ),
                )
              else
                Expanded(
                  child: Text(
                    selectedOption.value.isNotEmpty
                        ? selectedOption.label
                        : (widget.placeholder ?? '请选择'),
                    style: TextStyle(
                      color: selectedOption.value.isNotEmpty
                          ? Colors.black87
                          : Colors.grey[400],
                    ),
                  ),
                ),
              if (widget.clearable &&
                  selectedOption.value.isNotEmpty &&
                  !widget.disabled)
                GestureDetector(
                  onTap: () {
                    widget.onChanged?.call(null);
                    _hideOverlay();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.grey,
                  ),
                )
              else
                Icon(
                  Icons.arrow_drop_down,
                  color: widget.disabled ? Colors.grey : Colors.black54,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
