import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../input/yg_input.dart';

class YGDatePicker extends StatefulWidget {
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final String? placeholder;
  final bool disabled;
  final bool clearable;
  final String format;
  final DateTime? minDate;
  final DateTime? maxDate;

  const YGDatePicker({
    Key? key,
    this.value,
    this.onChanged,
    this.placeholder,
    this.disabled = false,
    this.clearable = false,
    this.format = 'yyyy-MM-dd',
    this.minDate,
    this.maxDate,
  }) : super(key: key);

  @override
  State<YGDatePicker> createState() => _YGDatePickerState();
}

class _YGDatePickerState extends State<YGDatePicker> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  late DateTime _currentMonth;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.value;
    _currentMonth = widget.value ?? DateTime.now();
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  void _showOverlay() {
    if (_overlayEntry != null || widget.disabled) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 280,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 4.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                _buildCalendar(),
              ],
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

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(
                  _currentMonth.year,
                  _currentMonth.month - 1,
                );
              });
            },
          ),
          Text(
            DateFormat('yyyy年MM月').format(_currentMonth),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(
                  _currentMonth.year,
                  _currentMonth.month + 1,
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    final firstDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final firstWeekday = firstDayOfMonth.weekday;
    final daysInMonth = lastDayOfMonth.day;

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // 星期标题
          Row(
            children: const [
              _WeekdayLabel('一'),
              _WeekdayLabel('二'),
              _WeekdayLabel('三'),
              _WeekdayLabel('四'),
              _WeekdayLabel('五'),
              _WeekdayLabel('六'),
              _WeekdayLabel('日'),
            ],
          ),
          // 日期网格
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 7,
            children: List.generate(42, (index) {
              final dayOffset = index - (firstWeekday - 1);
              final currentDate = DateTime(
                _currentMonth.year,
                _currentMonth.month,
                dayOffset,
              );

              if (dayOffset < 1 || dayOffset > daysInMonth) {
                return const SizedBox();
              }

              final bool isSelected = _selectedDate != null &&
                  _selectedDate!.year == currentDate.year &&
                  _selectedDate!.month == currentDate.month &&
                  _selectedDate!.day == currentDate.day;

              final bool isDisabled = (widget.minDate != null &&
                      currentDate.isBefore(widget.minDate!)) ||
                  (widget.maxDate != null &&
                      currentDate.isAfter(widget.maxDate!));

              return _DateCell(
                date: currentDate,
                isSelected: isSelected,
                isDisabled: isDisabled,
                onTap: isDisabled
                    ? null
                    : () {
                        setState(() {
                          _selectedDate = currentDate;
                        });
                        widget.onChanged?.call(currentDate);
                        _hideOverlay();
                      },
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = _selectedDate != null
        ? DateFormat(widget.format).format(_selectedDate!)
        : '';

    return CompositedTransformTarget(
      link: _layerLink,
      child: YGInput(
        value: displayText,
        placeholder: widget.placeholder ?? '请选择日期',
        readOnly: true,
        disabled: widget.disabled,
        suffix: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.clearable && displayText.isNotEmpty && !widget.disabled)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = null;
                  });
                  widget.onChanged?.call(null);
                },
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            const SizedBox(width: 4),
            const Icon(
              Icons.calendar_today,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
        onTap: _isOpen ? _hideOverlay : _showOverlay,
      ),
    );
  }
}

class _WeekdayLabel extends StatelessWidget {
  final String text;

  const _WeekdayLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _DateCell extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback? onTap;

  const _DateCell({
    required this.date,
    this.isSelected = false,
    this.isDisabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1890FF) : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            date.day.toString(),
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : isDisabled
                      ? Colors.grey[400]
                      : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
