import 'package:fitfind/imports.dart';

// untuk ukuran yg kecil
class SmallAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextBuilder(
        text: 'FIT',
        color: Constraints.APP_BAR_HOME_TEXT1_COLOR,
        fontSize: 20.0,
      ),
      TextBuilder(
        text: 'FIND',
        color: Constraints.APP_BAR_HOME_TEXT2_COLOR,
        fontSize: 20.0,
      ),
    ]);
  }
}
