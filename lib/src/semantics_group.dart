// SPDX-FileCopyrightText: 2024 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import "package:flutter/material.dart";

/// Used to group a set of [CustomSemantics] widgets together.
/// This is used to create a unique identifier for a group of widgets.
/// The groupName automatically gets added to the identifier of the children.
/// This widget is useful when you have generic widgets that can occur multiple
/// times on a screen and you want to make sure that the accessibility IDs are
/// unique without making the code too complex.
class SemanticsGroup extends StatelessWidget {
  /// Creates a [SemanticsGroup] widget.
  /// the [separator] is used to separate the group names.
  const SemanticsGroup(
    this.groupName, {
    required this.child,
    this.separator = "_",
    super.key,
  });

  /// The widget to wrap with the group.
  final Widget child;

  /// The name of the group.
  final String groupName;

  /// The separator to use between group names.
  final String separator;

  @override
  Widget build(BuildContext context) {
    var parentNames =
        SemanticsGroupInheritedWidget.maybeOf(context)?.names ?? <String>[];
    var updatedNames = [...parentNames, groupName];
    return SemanticsGroupInheritedWidget(
      names: updatedNames,
      separator: separator,
      key: key,
      child: child,
    );
  }
}

/// An inherited widget that holds the group names.
class SemanticsGroupInheritedWidget extends InheritedWidget {
  /// Creates a [SemanticsGroupInheritedWidget] widget.
  const SemanticsGroupInheritedWidget({
    required this.names,
    required this.separator,
    required super.child,
    super.key,
  });

  /// The group names.
  final List<String> names;

  /// The separator to use between group names.
  final String separator;

  /// The full name of the group.
  String get fullName => names.join(separator);

  /// Gets the [SemanticsGroupInheritedWidget] from the context.
  static SemanticsGroupInheritedWidget? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<SemanticsGroupInheritedWidget>();

  @override
  bool updateShouldNotify(SemanticsGroupInheritedWidget oldWidget) =>
      names != oldWidget.names || separator != oldWidget.separator;
}
