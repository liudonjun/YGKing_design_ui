import 'package:flutter/material.dart';
import '../../widgets/yg_nav_bar.dart';
import '../../routes/component_routes.dart';
import '../../themes/yg_theme_colors.dart';

class ComponentsPage extends StatefulWidget {
  const ComponentsPage({Key? key}) : super(key: key);

  @override
  State<ComponentsPage> createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  late String currentPath;

  @override
  void initState() {
    super.initState();
    currentPath = ComponentRoutes.routes.first.path;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = screenWidth < 768;
    final ComponentRoute? currentRoute =
        ComponentRoutes.getRouteByPath(currentPath);

    return Scaffold(
      drawer: isMobile
          ? Drawer(
              child: Column(
                children: [
                  Container(
                    height: 64,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'YGking Design',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: YGThemeColors.primary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey[100],
                      child: SingleChildScrollView(
                        child: _buildSideMenu(isMobile),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: Builder(
        builder: (context) => Column(
          children: [
            YGNavBar(
              onMenuPressed: isMobile
                  ? () {
                      Scaffold.of(context).openDrawer();
                    }
                  : null,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMobile)
                    Container(
                      width: 240,
                      height: screenHeight - 64,
                      color: Colors.grey[100],
                      child: SingleChildScrollView(
                        child: _buildSideMenu(isMobile),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      height: screenHeight - 64,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(isMobile ? 16 : 24),
                        child:
                            currentRoute?.builder(context) ?? const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideMenu(bool isMobile) {
    final groupedRoutes = ComponentRoutes.getGroupedRoutes();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedRoutes.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 6 : 8,
              ),
              child: Text(
                entry.key,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey,
                ),
              ),
            ),
            ...entry.value.map((route) => _buildMenuItem(
                  route.title,
                  route.path,
                  route.icon,
                  currentPath == route.path,
                  isMobile,
                )),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildMenuItem(
    String title,
    String path,
    IconData? icon,
    bool isSelected,
    bool isMobile,
  ) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          setState(() {
            currentPath = path;
            if (isMobile) {
              Navigator.of(context).pop();
            }
          });
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 16,
            vertical: isMobile ? 8 : 12,
          ),
          color: isSelected ? YGThemeColors.primary.withOpacity(0.1) : null,
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: isMobile ? 14 : 16,
                  color: isSelected ? YGThemeColors.primary : Colors.black87,
                ),
                SizedBox(width: isMobile ? 6 : 8),
              ],
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? YGThemeColors.primary : Colors.black87,
                  fontSize: isMobile ? 13 : 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
