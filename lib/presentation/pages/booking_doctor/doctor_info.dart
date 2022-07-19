import 'package:developer/data/models/service_details_model.dart'
    as serviceDetails;
import 'package:flutter/material.dart';

import '../../../../widgets/shadow_btn_widget.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/colors.dart';

class DoctorInfoPage extends StatelessWidget {
  final serviceDetails.Data? doctorInfoModel;
  const DoctorInfoPage({
    Key? key,
    required this.doctorInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenDevices.heigth(context) * 0.60,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),

          /// zone doctor
/*          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: ScreenDevices.width(context) * 0.70,
                height: ScreenDevices.width(context) * 0.09,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: doctorInfoModel?.zone.toString(),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.width(context) * 0.09,
                child: Image.asset(
                  kZoneAreaImg,
                  scale: 20,
                ),
                decoration: BoxDecoration(
                    color: kSeeMoreColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),*/

          /// work days doctor
          if (doctorInfoModel!.openAt != null &&
              doctorInfoModel!.closedAt != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: ScreenDevices.width(context) * 0.70,
                  height: ScreenDevices.width(context) * 0.09,
                  child: ShadowButton(
                    backgroundColor: kSeeMoreColor,
                    name:
                        "من ${doctorInfoModel!.openAt} إلي  ${doctorInfoModel!.closedAt}",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: ScreenDevices.width(context) * 0.15,
                  height: ScreenDevices.width(context) * 0.09,
                  child: Image.asset(
                    kCalenderIcon,
                    scale: 3,
                  ),
                  decoration: BoxDecoration(
                      color: kSeeMoreColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],

          /// address doctor
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.72,
                height: ScreenDevices.heigth(context) * 0.06,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: "${doctorInfoModel!.address}",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.heigth(context) * 0.06,
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                decoration: BoxDecoration(
                    color: kSeeMoreColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ],
          ),

          SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }
}
