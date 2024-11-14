import 'package:flutter/material.dart';

class YGForm extends StatefulWidget {
  final List<YGFormItem> items;
  final EdgeInsetsGeometry? padding;
  final double? labelWidth;
  final bool colon;
  final YGFormLayout layout;
  final VoidCallback? onSubmit;
  final VoidCallback? onReset;

  const YGForm({
    Key? key,
    required this.items,
    this.padding,
    this.labelWidth,
    this.colon = true,
    this.layout = YGFormLayout.horizontal,
    this.onSubmit,
    this.onReset,
  }) : super(key: key);

  @override
  State<YGForm> createState() => YGFormState();
}

class YGFormState extends State<YGForm> {
  final Map<String, dynamic> _formData = {};
  final Map<String, GlobalKey<FormFieldState>> _fieldKeys = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      _fieldKeys[item.name] = GlobalKey<FormFieldState>();
    }
  }

  void submit() {
    if (validate()) {
      widget.onSubmit?.call();
    }
  }

  void reset() {
    _formData.clear();
    for (var key in _fieldKeys.values) {
      key.currentState?.reset();
    }
    widget.onReset?.call();
  }

  bool validate() {
    bool isValid = true;
    for (var key in _fieldKeys.values) {
      if (!key.currentState!.validate()) {
        isValid = false;
      }
    }
    return isValid;
  }

  Map<String, dynamic> getData() {
    return Map.from(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.items.map((item) {
            return _buildFormItem(item);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFormItem(YGFormItem item) {
    Widget field = FormField<dynamic>(
      key: _fieldKeys[item.name],
      validator: item.validator,
      initialValue: item.initialValue,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item.field,
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(
                    color: Color(0xFFFF4D4F),
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );

    if (widget.layout == YGFormLayout.vertical) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.label != null) ...[
              Row(
                children: [
                  if (item.required)
                    const Text(
                      '*',
                      style: TextStyle(
                        color: Color(0xFFFF4D4F),
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                  Text(
                    item.label!,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  if (widget.colon) const Text(':'),
                ],
              ),
              const SizedBox(height: 8),
            ],
            field,
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.label != null)
            SizedBox(
              width: widget.labelWidth ?? 100,
              child: Row(
                children: [
                  if (item.required)
                    const Text(
                      '*',
                      style: TextStyle(
                        color: Color(0xFFFF4D4F),
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                  Text(
                    item.label!,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  if (widget.colon) const Text(':'),
                ],
              ),
            ),
          Expanded(child: field),
        ],
      ),
    );
  }
}

class YGFormItem {
  final String name;
  final String? label;
  final Widget field;
  final bool required;
  final dynamic initialValue;
  final String? Function(dynamic)? validator;

  YGFormItem({
    required this.name,
    this.label,
    required this.field,
    this.required = false,
    this.initialValue,
    this.validator,
  });
}

enum YGFormLayout {
  horizontal,
  vertical,
}
