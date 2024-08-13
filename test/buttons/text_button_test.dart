import "package:flutter/material.dart" hide TextButton;
import "package:flutter_test/flutter_test.dart";
import "package:j1_ui/j1_ui.dart";
import "package:mocktail/mocktail.dart";

import "../helpers/mock_callbacks.dart";

void main() {
  group("Text Button", () {
    testWidgets("flat button functions as expected", (tester) async {
      final onPressed = MockVoidCallback();
      const smallKey = Key("small");
      const mediumKey = Key("medium");
      const largeKey = Key("large");

      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              TextButton(
                key: smallKey,
                text: "test",
                icon: JamIcons.h1,
                type: TextButtonType.flat,
                size: TextButtonDimens.small,
                color: WidgetColor.primary,
                onPressed: onPressed.call,
              ),
              TextButton(
                key: mediumKey,
                text: "test",
                icon: JamIcons.h2,
                type: TextButtonType.flat,
                color: WidgetColor.secondary,
                onPressed: onPressed.call,
                outlineColor: Colors.red,
                outlineWidth: 1,
              ),
              TextButton(
                key: largeKey,
                text: "test",
                icon: JamIcons.h3,
                type: TextButtonType.flat,
                color: WidgetColor.tertiary,
                size: TextButtonDimens.large,
                onPressed: onPressed.call,
              ),
              TextButton(
                text: "test",
                type: TextButtonType.flat,
                color: WidgetColor.error,
                onPressed: onPressed.call,
              ),
              TextButton(
                text: "test",
                type: TextButtonType.flat,
                size: TextButtonDimens.medium.copyWith(cornerRadius: Dimens.radius_l),
                color: WidgetColor.surface,
                onPressed: onPressed.call,
              ),
            ],
          ),
        ),
      );

      final smallFinder = find.byKey(smallKey);
      final mediumFinder = find.byKey(mediumKey);
      final largeFinder = find.byKey(largeKey);

      expect(smallFinder, findsOneWidget);
      expect(mediumFinder, findsOneWidget);
      expect(largeFinder, findsOneWidget);

      expect(find.byIcon(JamIcons.h1), findsOneWidget);
      expect(find.byIcon(JamIcons.h2), findsOneWidget);
      expect(find.byIcon(JamIcons.h3), findsOneWidget);

      await tester.tap(smallFinder);
      await tester.tap(mediumFinder);
      await tester.tap(largeFinder);

      verify(onPressed.call).called(3);
    });

    testWidgets("filled button functions as expected", (tester) async {
      final onPressed = MockVoidCallback();
      const smallKey = Key("small");
      const mediumKey = Key("medium");
      const largeKey = Key("large");

      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              TextButton(
                key: smallKey,
                text: "test",
                icon: JamIcons.h1,
                color: WidgetColor.primary,
                size: TextButtonDimens.small,
                onPressed: onPressed.call,
              ),
              TextButton(
                key: mediumKey,
                text: "test",
                icon: JamIcons.h2,
                color: WidgetColor.secondary,
                onPressed: onPressed.call,
                outlineColor: Colors.red,
                outlineWidth: 1,
              ),
              TextButton(
                key: largeKey,
                text: "test",
                icon: JamIcons.h3,
                color: WidgetColor.tertiary,
                size: TextButtonDimens.large,
                onPressed: onPressed.call,
              ),
              TextButton(
                text: "test",
                color: WidgetColor.error,
                onPressed: onPressed.call,
              ),
              TextButton(
                text: "test",
                color: WidgetColor.surface,
                size: TextButtonDimens.medium.copyWith(cornerRadius: Dimens.radius_l),
                onPressed: onPressed.call,
              ),
            ],
          ),
        ),
      );

      final smallFinder = find.byKey(smallKey);
      final mediumFinder = find.byKey(mediumKey);
      final largeFinder = find.byKey(largeKey);

      expect(smallFinder, findsOneWidget);
      expect(mediumFinder, findsOneWidget);
      expect(largeFinder, findsOneWidget);

      expect(find.byIcon(JamIcons.h1), findsOneWidget);
      expect(find.byIcon(JamIcons.h2), findsOneWidget);
      expect(find.byIcon(JamIcons.h3), findsOneWidget);

      await tester.tap(smallFinder);
      await tester.tap(mediumFinder);
      await tester.tap(largeFinder);

      verify(onPressed.call).called(3);
    });

    test("dimens is compared correctly", () {
      const dimens0 = TextButtonDimens.medium;
      final dimens1 = TextButtonDimens.medium.copyWith();
      final dimens2 = TextButtonDimens.medium.copyWith(iconSize: Dimens.size_16);

      expect(dimens0 == dimens1, true);
      expect(dimens0 == dimens2, false);
    });
  });
}
