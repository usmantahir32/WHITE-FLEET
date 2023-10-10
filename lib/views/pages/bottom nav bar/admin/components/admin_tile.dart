import 'package:flutter/material.dart';

class AdminTile extends StatelessWidget {
  const AdminTile({
    super.key,
    required this.title,
    required this.images,
    required this.ontap,
  });
  final String title, images;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        height:size.height*0.16,
        width: size.width*0.385,
        padding:
            EdgeInsets.symmetric(vertical: size.height*0.015),
        decoration: BoxDecoration(
          color: const Color(0xffEFF5FF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(
    color: Colors.grey.withOpacity(0.4),
    spreadRadius: 1,
    blurRadius: 2,
    offset: const Offset(0, 3),
  )],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textTheme.bodySmall!
                  .copyWith(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height*0.01),
            Image.asset(
              images,
              height: size.width*0.18,
            )
          ],
        ),
      ),
    );
  }
}
