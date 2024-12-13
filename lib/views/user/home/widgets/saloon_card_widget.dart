import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaloonCardWidget extends StatelessWidget {
  const SaloonCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 210 + 12 + 12,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).disabledColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 210,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/image3.jpg"))),
          ),
          SizedBox(
            width: 210,
            child: Row(
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    "Saloon Name $int",
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(child: Container()),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12,
                ),
                Text(
                  "4.6",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: 210 - 30,
                child: Text(
                  "Mohba Bajar Raipur,492010 sdfsald, asdjflskdjf, sdafjlsdjk ,sadaf",
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.clock,
                size: 16,
                color: Theme.of(context).disabledColor,
              ),
              Text(
                "  08:00 AM - 10:00 PM",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
