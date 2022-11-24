import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/utils/extensions.dart';


class JewellerPaymentDetailsCustom extends StatelessWidget {
  final String text;
  final String price;
  const JewellerPaymentDetailsCustom({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 9,
            child: Text(text,
                style: const TextStyle(color: Colors.black45, fontSize: 15))),
        Expanded(
            flex: 4,
            child: Text(
              price,
              style: const TextStyle(
                  color: Color(0xFF052a45),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ))
      ],
    ).commonOnlyPadding(bottom: 10);
  }
}


class TryAnotherPaymentMethod extends StatelessWidget {
  const TryAnotherPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.size.height*0.07,
        width: double.infinity,

        child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),primary: Colors.redAccent),
            onPressed: (){}, child: Text("TRY ANOTHER PAYMENT METHOD"))
    ).commonSymmetricPadding(horizontal: 15,vertical: 15);
  }
}

class SencoGoldContainer extends StatelessWidget {
  const SencoGoldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                "assets/diamonds_iocn.png",
              )),
          SizedBox(
            width: Get.size.width*0.06,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Senco Gold",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Swaarna Sanchay Scheme",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(22.0),
    ).commonAllSidePadding(8.0);
  }
}

class PaymentDetailForMonthlyContainer extends StatelessWidget {
  const PaymentDetailForMonthlyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: const [
            JewellerPaymentDetailsCustom(
              text: "Monthly Installment",
              price: "₹ 2500",
            ),
            JewellerPaymentDetailsCustom(
              text: "Balance payable at maturity",
              price: "₹ 32500",
            ),
            JewellerPaymentDetailsCustom(
              text: "Tenure",
              price: "12 months",
            ),
            JewellerPaymentDetailsCustom(
              text: "Starting Date",
              price: "31 July 2021",
            ),
            JewellerPaymentDetailsCustom(
              text: "Maturity Date",
              price: "31 July 2022",
            ),
          ],
        ).commonOnlyPadding(left: 25, right: 25, top: 20, bottom: 10),
      ),
    );
  }
}


class UnSuccessPaymentContainer extends StatelessWidget {
  const UnSuccessPaymentContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            "Your payment is unsuccessful  !",
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: Get.size.height*0.03,
          ),
          SizedBox(
              height: Get.size.height*0.20,
              child: Image.asset(
                "assets/declined_card.png",
              )),
          SizedBox(
            height: Get.size.height*0.02,
          ),
          const Text(
            "Try again",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          SizedBox(
            height: Get.size.height*0.02,
          ),
          const Text(
            "Payment has been declined",
            style: TextStyle(color: Colors.black54),
          )
        ],
      ).commonOnlyPadding(bottom: 15, top: 15),
    ).commonOnlyPadding(left: 8, right: 8);
  }
}


