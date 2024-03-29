import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:veggytably_driver/controllers/order_controller.dart';

import '../controllers/geo_controller.dart';
import '../utils/text_format.dart';

class MapPage extends StatelessWidget {
  final GeoController geoController = Get.put(GeoController());
  final DraggableScrollableController dragController =
      DraggableScrollableController();

  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<OrderController>(builder: (controller) {
          var currentPosition = geoController.currentPosition;
          var markers = <Marker>[];
          var points = <LatLng>[];

          if (controller.receivedOrder != null) {
            // markers
            Marker merchantMarker = Marker(
              point: LatLng(
                controller.receivedOrder!.merchantAddress.latitude,
                controller.receivedOrder!.merchantAddress.longitude,
              ),
              builder: (context) => IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.green,
                iconSize: 45,
              ),
            );

            Marker customerMarker = Marker(
              point: LatLng(
                controller.receivedOrder!.customerAddress.latitude,
                controller.receivedOrder!.customerAddress.longitude,
              ),
              builder: (context) => IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45,
              ),
            );

            markers.add(merchantMarker);
            markers.add(customerMarker);
            // routes
            var driverToMerchant =
                controller.receivedOrder!.routes["driverToMerchant"];
            var merchantToCustomer = controller.receivedOrder!
                .routes["merchantToCustomer"]; // customerToMerchant

            if (driverToMerchant != null && merchantToCustomer != null) {
              points.addAll(driverToMerchant.coordinates);
              points.addAll(merchantToCustomer.coordinates);
            }
          }

          markers.add(
            Marker(
              point: geoController.currentPosition,
              builder: (context) => IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_pin_circle),
                color: Colors.blue,
                iconSize: 45,
              ),
            ),
          );

          return FlutterMap(
            options: MapOptions(
              center: LatLng(
                  currentPosition.latitude - 0.008, currentPosition.longitude),
              zoom: 13.0,
            ),
            children: [
              // Map Layer
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              // Marker
              MarkerLayer(
                markers: markers,
              ),
              // polyline layer
              controller.receivedOrder != null
                  ? PolylineLayer(
                      polylines: [
                        // driver to merchant
                        Polyline(
                          points: points,
                          strokeWidth: 4.0,
                          color: Colors.blue,
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          );
        }),
        DraggableScrollableSheet(
          controller: dragController,
          initialChildSize: 0.4,
          snapSizes: const [0.4, 0.8],
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 4,
                      offset: Offset(0, -4),
                    ),
                  ],
                  color: Color(0xfff8f8f8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: GetBuilder<OrderController>(builder: (controller) {
                    if (controller.isListening.value ||
                        controller.receivedOrder == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var order = controller.receivedOrder;
                    return ListView(
                      controller: scrollController,
                      children: <Widget>[
                        const SizedBox(height: 8),
                        Center(
                          child: Container(
                            width: 100,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffd1d1d6),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                //outline
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.account_circle_outlined,
                                  color: Color(0xffd1d1d6),
                                  size: 44,
                                )),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order!.customerName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: const Color(0xfffee7a2),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              order.paymentMethod,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Rp25.000,00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        TextFormatter.convertMeterToKm(order
                                                .routes["driverToMerchant"]!
                                                .distance +
                                            order.routes["merchantToCustomer"]!
                                                .distance),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 18),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "TITIK JEMPUT",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              TextFormatter.splitWords(
                                  order.merchantAddress.address, 2),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              order.merchantAddress.address,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "TITIK ANTAR",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              TextFormatter.splitWords(
                                  order.customerAddress.address, 2),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              order.customerAddress.address,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ORDER DETAILS",
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 15,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Flexible(
                                fit: FlexFit.loose,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: order.orderList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, bottom: 4),
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                '${order.orderList[index].quantity}x',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: "Rubik",
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                order
                                                    .orderList[index].menu.name,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: "Rubik",
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                TextFormatter.formatCurrency(
                                                    order.orderList[index].menu
                                                        .price),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: "Rubik",
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          thickness: 1,
                                        ),
                                      ]),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<OrderController>(
                          builder: (orderController) {
                            if (orderController.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (controller.isAccepted.value) {
                              if (controller.status.value == 'ON_DELIVERY') {
                                return ElevatedButton(
                                  onPressed: () {
                                    controller.finishOrder();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff70cb88),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'FINISH ORDER',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }

                              return ElevatedButton(
                                onPressed: () {
                                  controller.deliverOrder();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff70cb88),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'DELIVER ORDER',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }

                            return Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 48,
                                  height: 44,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.acceptOrder();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff70cb88),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'ACCEPT',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                    height: 44,
                                    width:
                                        MediaQuery.of(context).size.width - 48,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          height: 44,
                                          width: 74 /
                                              (312) *
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  48),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: const Color(0xff70cb88),
                                              width: 1,
                                            ),
                                          ),
                                          child: Obx(
                                            () => Text(
                                              controller.minutes,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xff70cb88),
                                                fontSize: 15,
                                                fontFamily: "Rubik",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 9 /
                                              (312) *
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  48),
                                        ),
                                        SizedBox(
                                          height: 44,
                                          width: 229 /
                                              (312) *
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  48),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.rejectOrder();
                                              if (dragController.isAttached) {
                                                dragController.animateTo(
                                                  0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeOut,
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              side: const BorderSide(
                                                color: Color(0xff70cb88),
                                                width: 1,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              primary: const Color(0xfff8f8f8),
                                            ),
                                            child: const Text(
                                              'DECLINE',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff70cb88),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  }),
                ));
          },
        ),
      ],
    );
  }
}
