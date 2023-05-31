import 'package:flutter/material.dart';

mixin MyPreferredSizeMixin implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60); // Customize the preferred size value according to your needs
}