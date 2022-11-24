import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_images.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_scheme_pending_payment_screen_controller.dart';

enum ProductTypeEnum { paytm, googlepay, amazonpay, visa, cashondelivery }

class PayNowButton extends StatelessWidget {
  const PayNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SizedBox(
        height: Get.size.height * 0.07,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.redAccent),
          onPressed: () {},
          child: const Text("PAY NOW"),
        ),
      ),
    );
  }
}

class PaymentDetails extends StatelessWidget {
  PaymentDetails({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemePendingPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "2 Invoices",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.size.height * 0.01,
              ),
              const Divider(
                color: Colors.red,
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "PROLLN-028976",
                              style: TextStyle(
                                  color: Color(0xFF052a45),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Text("₹ 2500",
                                style: TextStyle(
                                    color: Color(0xFF052a45),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))
                          ],
                        ),
                        SizedBox(
                          height: Get.size.height * 0.01,
                        ),
                        const Text(
                          "Invoice number",
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(height: Get.size.height * 0.01),
                        Row(
                          children: [
                            const Text(
                              "Billing Date",
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(
                              width: Get.size.width * 0.04,
                            ),
                            const Text(
                              "31 July 2021",
                              style: TextStyle(
                                  color: Color(0xFF052a45),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Get.size.height * 0.025,
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: Get.size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Late payment fee ₹ 100",
                    style: TextStyle(color: Colors.red),
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

class PaymentMethods extends StatefulWidget {
  PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  ProductTypeEnum? _productTypeEnum;

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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total Payable",
                    style: TextStyle(
                        color: Color(0xFF052a45),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₹ 5100",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                // height: 20,
                height: Get.size.height * 0.04,
              ),
              const Text(
                "Payment methods",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              ),
              Column(
                children: [
                  RadioListTile<ProductTypeEnum>(
                      title: Row(
                        children: [
                          SizedBox(
                            height: Get.size.height * 0.025,
                            child: Image.asset(
                              AppImages.paytmImage,
                            ),
                          ),
                        ],
                      ),
                      value: ProductTypeEnum.paytm,
                      groupValue: _productTypeEnum,
                      onChanged: (val) {
                        setState(() {
                          _productTypeEnum = val;
                        });
                      }),
                  RadioListTile<ProductTypeEnum>(
                      title: Row(
                        children: [
                          SizedBox(
                              height: Get.size.height * 0.025,
                              child: Image.asset(
                                AppImages.gpayImage,
                              )),
                        ],
                      ),
                      value: ProductTypeEnum.googlepay,
                      groupValue: _productTypeEnum,
                      onChanged: (val) {
                        setState(() {
                          _productTypeEnum = val;
                        });
                      }),
                  RadioListTile<ProductTypeEnum>(
                      title: Row(
                        children: [
                          SizedBox(
                            height: Get.size.height * 0.025,
                            child: Image.asset(
                              AppImages.amoZonImage,
                            ),
                          ),
                        ],
                      ),
                      value: ProductTypeEnum.amazonpay,
                      groupValue: _productTypeEnum,
                      onChanged: (val) {
                        setState(() {
                          _productTypeEnum = val;
                        });
                      }),
                  RadioListTile<ProductTypeEnum>(
                      title: Row(
                        children: [
                          SizedBox(
                            height: Get.size.height * 0.025,
                            child: Image.asset(
                              AppImages.visaImage,
                            ),
                          ),
                        ],
                      ),
                      value: ProductTypeEnum.visa,
                      groupValue: _productTypeEnum,
                      onChanged: (val) {
                        setState(() {
                          _productTypeEnum = val;
                        });
                      }),
                  RadioListTile<ProductTypeEnum>(
                    title: Row(
                      children: [
                        SizedBox(
                            height: Get.size.height * 0.025,
                            child: Image.asset(
                              AppImages.cashImage,
                            )),
                      ],
                    ),
                    value: ProductTypeEnum.cashondelivery,
                    groupValue: _productTypeEnum,
                    onChanged: (val) {
                      setState(() {
                        _productTypeEnum = val;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}