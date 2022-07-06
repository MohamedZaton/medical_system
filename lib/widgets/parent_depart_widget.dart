import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../data/models/category_model.dart' as categoryList;
import '../core/utils/math_methods.dart';
import 'flux_image.dart';

class ParentDpItemWgt extends StatelessWidget {
  final categoryList.Data homeItemModel;
  final int index;
  final bool? hasRating;
  final double? initialRating;

  final Function()? onPressed;
  const ParentDpItemWgt({
    Key? key,
    required this.homeItemModel,
    required this.index,
    required this.onPressed,
    this.initialRating,
    this.hasRating = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;

    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 1),
          blurRadius: 2.0,
        ),
      ]),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: kDarkAccent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// main info 2
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    homeItemModel.nameAr ?? homeItemModel.nameEn!,
                    style: TextStyle(
                        fontFamily: 'Sukar',
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  if (hasRating ?? false) ...[
                    Container(
                      child: RatingBar.builder(
                        itemSize: 25,
                        initialRating:
                            initialRating ?? MathMethods.getRandom(1, 5),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        ignoreGestures: true,
                        tapOnlyMode: true,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ]
                ],
              ),
              SizedBox(
                width: 20,
              ),

              /// main pic 2
              FluxImage(
                imageUrl: homeItemModel.icon!,
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
