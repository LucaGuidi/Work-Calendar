import 'package:flutter/material.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> weekdays = [
      "",
      "Mo",
      "Tu",
      "We",
      "Th",
      "Fr",
      "Sa",
      "Su"
    ];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
                Text(
                  'gennaio - 2023',
                  style: context.theme.textTheme.titleMedium!.copyWith(
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            // HEADER (WEEK DAYS)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 8,
                childAspectRatio: 1 / 0.8,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  for (var day in weekdays)
                    Text(
                      day,
                      textAlign: TextAlign.end,
                      style: context.theme.textTheme.titleSmall!.copyWith(
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                ],
              ),
            ),

            // LEFT COLUMN (WEEK COUNT)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 38,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              (index * 6).toString(),
                              textAlign: TextAlign.center,
                              style: context.theme.textTheme.titleSmall!.copyWith(
                                color: context.theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        );
                      },
                    ),
                  ),
                  // CALENDAR
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: 1 / 0.8,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: 42,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text((index + 1).toString()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
