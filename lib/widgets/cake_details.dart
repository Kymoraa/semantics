import 'package:flutter/material.dart';
import 'package:semantics_widget/utils/colors.dart';

class CakeDetailsScreen extends StatefulWidget {
  const CakeDetailsScreen({super.key, required this.cakeName, required this.cakeImageUrl, required this.currentPrice});

  final String cakeName;
  final String cakeImageUrl;
  final String currentPrice;

  @override
  State<CakeDetailsScreen> createState() => _CakeDetailsScreenState();
}

class _CakeDetailsScreenState extends State<CakeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: kTransparentColor,
      insetPadding: const EdgeInsets.all(20),
      content: SizedBox(
        height: height * 0.6,
        width: width,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              topLeft: Radius.circular(15.0),
            ),
            color: kWhiteColor,
          ),
          height: 520,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.75,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage(widget.cakeImageUrl),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This moist ${widget.cakeName} cupcake has been topped with a fluffy & creamy frosting that simply melts in your mouth. It is a party of flavours in one bite!',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
