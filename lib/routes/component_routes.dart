import 'package:flutter/material.dart';
import '../pages/components/demos/button_demo.dart';
import '../pages/components/demos/input_demo.dart';
import '../pages/components/demos/switch_demo.dart';
import '../pages/components/demos/progress_demo.dart';
import '../pages/components/demos/card_demo.dart';
import '../pages/components/demos/tag_demo.dart';
import '../pages/components/demos/badge_demo.dart';
import '../pages/components/demos/tooltip_demo.dart';
import '../pages/components/demos/divider_demo.dart';
import '../pages/components/demos/avatar_demo.dart';
import '../pages/components/demos/icon_demo.dart';
import '../pages/components/demos/menu_demo.dart';
import '../pages/components/demos/table_demo.dart';
import '../pages/components/demos/dialog_demo.dart';
import '../pages/components/demos/drawer_demo.dart';
import '../pages/components/demos/form_demo.dart';
import '../pages/components/demos/select_demo.dart';
import '../pages/components/demos/notification_demo.dart';
import '../pages/components/demos/loading_demo.dart';
import '../pages/components/demos/date_picker_demo.dart';
import '../pages/components/demos/upload_demo.dart';
import '../pages/components/demos/message_demo.dart';
import '../pages/components/demos/pagination_demo.dart';
import '../pages/components/demos/rate_demo.dart';
import '../pages/components/demos/timeline_demo.dart';
import '../pages/components/demos/tabs_demo.dart';

class ComponentRoute {
  final String title;
  final String path;
  final Widget Function(BuildContext) builder;
  final IconData? icon;
  final String group;

  const ComponentRoute({
    required this.title,
    required this.path,
    required this.builder,
    this.icon,
    required this.group,
  });
}

class ComponentRoutes {
  static const String baseRoute = '/components';

  static final List<ComponentRoute> routes = [
    // 通用
    ComponentRoute(
      title: '按钮 Button',
      path: '$baseRoute/button',
      builder: (context) => const ButtonDemo(),
      icon: Icons.smart_button,
      group: '通用',
    ),
    // 数据录入
    ComponentRoute(
      title: '输入框 Input',
      path: '$baseRoute/input',
      builder: (context) => const InputDemo(),
      icon: Icons.input,
      group: '数据录入',
    ),
    ComponentRoute(
      title: '开关 Switch',
      path: '$baseRoute/switch',
      builder: (context) => const SwitchDemo(),
      icon: Icons.toggle_on,
      group: '数据录入',
    ),
    // 数据展示
    ComponentRoute(
      title: '进度条 Progress',
      path: '$baseRoute/progress',
      builder: (context) => const ProgressDemo(),
      icon: Icons.trending_up,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '卡片 Card',
      path: '$baseRoute/card',
      builder: (context) => const CardDemo(),
      icon: Icons.credit_card,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '标签 Tag',
      path: '$baseRoute/tag',
      builder: (context) => const TagDemo(),
      icon: Icons.label,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '徽章 Badge',
      path: '$baseRoute/badge',
      builder: (context) => const BadgeDemo(),
      icon: Icons.brightness_1,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '文字提示 Tooltip',
      path: '$baseRoute/tooltip',
      builder: (context) => const TooltipDemo(),
      icon: Icons.info_outline,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '分割线 Divider',
      path: '$baseRoute/divider',
      builder: (context) => const DividerDemo(),
      icon: Icons.horizontal_rule,
      group: '布局',
    ),
    ComponentRoute(
      title: '头像 Avatar',
      path: '$baseRoute/avatar',
      builder: (context) => const AvatarDemo(),
      icon: Icons.account_circle,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '图标 Icon',
      path: '$baseRoute/icon',
      builder: (context) => const IconDemo(),
      icon: Icons.emoji_emotions,
      group: '通用',
    ),
    ComponentRoute(
      title: '菜单 Menu',
      path: '$baseRoute/menu',
      builder: (context) => const MenuDemo(),
      icon: Icons.menu,
      group: '导航',
    ),
    ComponentRoute(
      title: '表格 Table',
      path: '$baseRoute/table',
      builder: (context) => const TableDemo(),
      icon: Icons.table_chart,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '对话框 Dialog',
      path: '$baseRoute/dialog',
      builder: (context) => const DialogDemo(),
      icon: Icons.chat_bubble_outline,
      group: '反馈',
    ),
    ComponentRoute(
      title: '抽屉 Drawer',
      path: '$baseRoute/drawer',
      builder: (context) => const DrawerDemo(),
      icon: Icons.menu_open,
      group: '反馈',
    ),
    ComponentRoute(
      title: '表单 Form',
      path: '$baseRoute/form',
      builder: (context) => const FormDemo(),
      icon: Icons.assignment,
      group: '数据录入',
    ),
    ComponentRoute(
      title: '选择器 Select',
      path: '$baseRoute/select',
      builder: (context) => const SelectDemo(),
      icon: Icons.arrow_drop_down_circle,
      group: '数据录入',
    ),
    ComponentRoute(
      title: '通知提醒框 Notification',
      path: '$baseRoute/notification',
      builder: (context) => const NotificationDemo(),
      icon: Icons.notifications,
      group: '反馈',
    ),
    ComponentRoute(
      title: '加载中 Loading',
      path: '$baseRoute/loading',
      builder: (context) => const LoadingDemo(),
      icon: Icons.refresh,
      group: '反馈',
    ),
    ComponentRoute(
      title: '日期选择器 DatePicker',
      path: '$baseRoute/date-picker',
      builder: (context) => const DatePickerDemo(),
      icon: Icons.calendar_today,
      group: '数据录入',
    ),
    ComponentRoute(
      title: '上传 Upload',
      path: '$baseRoute/upload',
      builder: (context) => const UploadDemo(),
      icon: Icons.upload_file,
      group: '数据录入',
    ),
    ComponentRoute(
      title: '全局提示 Message',
      path: '$baseRoute/message',
      builder: (context) => const MessageDemo(),
      icon: Icons.message,
      group: '反馈',
    ),
    ComponentRoute(
      title: '分页 Pagination',
      path: '$baseRoute/pagination',
      builder: (context) => const PaginationDemo(),
      icon: Icons.pages,
      group: '导航',
    ),
    ComponentRoute(
      title: '评分 Rate',
      path: '$baseRoute/rate',
      builder: (context) => const RateDemo(),
      icon: Icons.star,
      group: '数据录入',
    ),
    ComponentRoute(
      title: '时间轴 Timeline',
      path: '$baseRoute/timeline',
      builder: (context) => const TimelineDemo(),
      icon: Icons.timeline,
      group: '数据展示',
    ),
    ComponentRoute(
      title: '标签页 Tabs',
      path: '$baseRoute/tabs',
      builder: (context) => const TabsDemo(),
      icon: Icons.tab,
      group: '导航',
    ),
  ];

  static Map<String, List<ComponentRoute>> getGroupedRoutes() {
    final Map<String, List<ComponentRoute>> grouped = {};
    for (var route in routes) {
      if (!grouped.containsKey(route.group)) {
        grouped[route.group] = [];
      }
      grouped[route.group]!.add(route);
    }
    return grouped;
  }

  static ComponentRoute? getRouteByPath(String path) {
    try {
      return routes.firstWhere((route) => route.path == path);
    } catch (e) {
      return null;
    }
  }
}
