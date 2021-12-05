
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class PeliSelectButton extends StatelessWidget {
  final Function? onPressed;
  final String? text;
  final Widget? icon;

  const PeliSelectButton({Key? key, this.onPressed, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onPressed as void Function()?,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 4.0,
                shadowColor: Colors.black12,
                primary:
                ThemeProvider.controllerOf(context).theme.data.cardColor,
                onPrimary: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 18,
                ),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      text!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              onPressed: onPressed as void Function()?,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: icon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
