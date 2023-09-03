import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../utilities/consts.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    Key? key,
    required this.title,
    this.subtitle,
    required this.onDelete,
    required this.onEdit,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Function() onEdit;
  final Function() onDelete;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(Consts.defaultBorderRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Consts.paddingMedium),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  title,
                ),
                subtitle: subtitle != null
                    ? Text(
                        subtitle!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onDelete,
                    child: const Text("حذف"),
                    // style:  ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.error),
                    // ),
                  ),
                  const SizedBox(
                    width: Consts.paddingSmall,
                  ),
                  FilledButton(
                    onPressed: onEdit,
                    child: const Text("تعديل"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
