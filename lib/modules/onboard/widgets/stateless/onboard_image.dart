import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardImage extends StatelessWidget {
  OnboardImage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 20.0, end: 19.9),
          Pin(size: 388.1, middle: 0.5001),
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(start: 38.8, end: 13.3),
                Pin(start: 52.6, end: 38.7),
                child: SvgPicture.string(
                  _svg_241hc4,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 281.0, start: 31.8),
                Pin(size: 248.2, middle: 0.4805),
                child: SvgPicture.string(
                  _svg_14s9o6,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 281.0, start: 11.8),
                Pin(size: 248.2, start: 47.2),
                child: SvgPicture.string(
                  _svg_sdkpa9,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(start: 0.0, end: 0.0),
                Pin(start: 0.0, end: 0.0),
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 74.0, end: 74.0),
                      Pin(start: 39.6, end: 39.6),
                      child: Transform.rotate(
                        angle: -0.7854,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/sethescope.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const String _svg_241hc4 =
    '<svg viewBox="32.8 54.0 336.0 296.8" ><path  d="M 52.26549911499023 248.572998046875 C -1.87594997882843 170.4120025634766 64.527099609375 79.86730194091797 158.0899963378906 62.94480133056641 L 194.0859985351562 56.43439865112305 C 291.7690124511719 38.76679992675781 378.885986328125 120.2050018310547 367.8340148925781 218.8549957275391 C 355.6709899902344 327.4219970703125 234.2660064697266 386.0069885253906 141.7079925537109 327.9729919433594 L 110.8560028076172 308.6289978027344 C 90.69640350341797 295.989013671875 73.36519622802734 279.1640014648438 59.86380004882812 259.5700073242188 C 57.21049880981445 255.7200012207031 54.67990112304688 252.0590057373047 52.26549911499023 248.572998046875 Z" fill="#cdcef7" fill-opacity="0.96" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_14s9o6 =
    '<svg viewBox="25.8 68.6 281.0 248.2" ><path  d="M 42.06949996948242 231.3079986572266 C -3.206300020217896 165.9459991455078 52.32320022583008 90.22779846191406 130.5659942626953 76.07630157470703 L 160.6670074462891 70.63200378417969 C 242.35400390625 55.85749816894531 315.2059936523438 123.9599990844727 305.9630126953125 206.4559936523438 C 295.7919921875 297.2460021972656 194.2669982910156 346.2369995117188 116.8659973144531 297.7059936523438 L 91.06620025634766 281.5299987792969 C 74.20729827880859 270.9599914550781 59.7140998840332 256.8900146484375 48.42359924316406 240.5039978027344 C 46.20479965209961 237.2839965820312 44.0885009765625 234.2230072021484 42.06949996948242 231.3079986572266 Z" fill="#f2f6fd" fill-opacity="0.6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sdkpa9 =
    '<svg viewBox="5.8 48.6 281.0 248.2" ><path  d="M 22.06949996948242 211.3079986572266 C -23.20630073547363 145.9459991455078 32.32320022583008 70.22779846191406 110.5660018920898 56.07630157470703 L 140.6670074462891 50.63199996948242 C 222.35400390625 35.85749816894531 295.2059936523438 103.9599990844727 285.9630126953125 186.4559936523438 C 275.7919921875 277.2460021972656 174.2669982910156 326.2369995117188 96.86579895019531 277.7059936523438 L 71.06620025634766 261.5299987792969 C 54.20729827880859 250.9600067138672 39.7140998840332 236.8899993896484 28.42359924316406 220.5039978027344 C 26.20479965209961 217.2839965820312 24.08849906921387 214.2230072021484 22.06949996948242 211.3079986572266 Z" fill="#f2f6fd" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
