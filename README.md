# Flutter Accessibility

Flutter widgets are not accessible by default for Appium and other testing frameworks.
This package adds accessibility to your widgets by wrapping them with CustomSemantics and SemanticsGroup.
This will provide an accessibility_id for the widget.

Note that on Android this doesn't work on textfields because they will not be editable again.
Because of this you will need to add `isTextField: true` to the CustomSemantics widget.


## How to use

You can wrap your widget with CustomSemantics to add accessibility to your widget.
```dart
 CustomSemantics(
          identifier: "text",
          child: Text("Text"),
        ),
``` 

You can group widgets together with a SemanticsGroup to update the identifier of underlying CustomSemantics with the identifier of the SemanticsGroup.
```dart
 SemanticsGroup(
          identifier: "group",
          children: [
            CustomSemantics(
              identifier: "text1",
              child: Text("Text1"),
            ),
            CustomSemantics(
              identifier: "text2",
              child: Text("Text2"),
            ),
          ],
        ),
```

## Issues

Please file any issues, bugs or feature request as an issue on our [GitHub](https://github.com/Iconica-Development/flutter_accessibility/issues) page.
Commercial support is available if you need help with integration with your app or services. You can contact us at [support@iconica.nl](mailto:support@iconica.nl).

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](../CONTRIBUTING.md) and send us your [pull request](https://github.com/Iconica-Development/flutter_accessibility/pulls).

## Author

This `flutter_accessibility` for Flutter is developed by [Iconica](https://iconica.nl). You can contact us at <support@iconica.nl>