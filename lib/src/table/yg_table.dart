import 'package:flutter/material.dart';

class YGTableColumn<T> {
  final String title;
  final String field;
  final Widget Function(T)? render;
  final double? width;
  final bool sortable;
  final TextAlign? align;

  const YGTableColumn({
    required this.title,
    required this.field,
    this.render,
    this.width,
    this.sortable = false,
    this.align,
  });
}

class YGTable<T> extends StatefulWidget {
  final List<YGTableColumn<T>> columns;
  final List<T> dataSource;
  final bool loading;
  final double? width;
  final double? height;
  final bool bordered;
  final bool striped;
  final ValueChanged<T>? onRowTap;

  const YGTable({
    Key? key,
    required this.columns,
    required this.dataSource,
    this.loading = false,
    this.width,
    this.height,
    this.bordered = true,
    this.striped = false,
    this.onRowTap,
  }) : super(key: key);

  @override
  State<YGTable<T>> createState() => _YGTableState<T>();
}

class _YGTableState<T> extends State<YGTable<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: widget.bordered
            ? Border.all(color: Colors.grey[200]!)
            : const Border(),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              ...widget.dataSource.asMap().entries.map(
                    (entry) => _buildRow(entry.value, entry.key.isEven),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.grey[100],
      child: Row(
        children: widget.columns.map((column) {
          return Container(
            width: column.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: widget.bordered
                  ? Border(
                      right: BorderSide(color: Colors.grey[200]!),
                      bottom: BorderSide(color: Colors.grey[200]!),
                    )
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    column.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: column.align,
                  ),
                ),
                if (column.sortable) const Icon(Icons.arrow_upward, size: 16),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRow(T data, bool isEven) {
    return Material(
      color: widget.striped && isEven ? Colors.grey[50] : Colors.white,
      child: InkWell(
        onTap: widget.onRowTap != null ? () => widget.onRowTap!(data) : null,
        child: Row(
          children: widget.columns.map((column) {
            final value = _getValue(data, column);
            return Container(
              width: column.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: widget.bordered
                    ? Border(
                        right: BorderSide(color: Colors.grey[200]!),
                        bottom: BorderSide(color: Colors.grey[200]!),
                      )
                    : null,
              ),
              child: column.render != null
                  ? column.render!(data)
                  : Text(
                      value.toString(),
                      textAlign: column.align,
                    ),
            );
          }).toList(),
        ),
      ),
    );
  }

  dynamic _getValue(T data, YGTableColumn<T> column) {
    if (data is Map) {
      return data[column.field];
    }
    // 如果需要支持其他数据类型，可以在这里添加
    return '';
  }
}
