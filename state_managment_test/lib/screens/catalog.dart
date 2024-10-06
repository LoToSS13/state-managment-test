// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:state_managment_test/models/cart.dart';
import 'package:state_managment_test/models/catalog.dart';
import 'package:state_managment_test/screens/cart.dart';

class MyCatalog extends StatefulWidget {
  static const routeName = 'catalog';

  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  final _cart = CartModel();

  @override
  void initState() {
    // TODO: здесь явно что-то нужно поменять
    _cart.catalog = CatalogModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => _MyListItem(_cart.catalog.getByPosition(index))),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: здесь тоже нужно что-то изменить
    // Параметр определяет находится ли товар в корзине
    var isInCart = false;

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              // TODO: здесь мы должны добавить товар в корзину
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
      child: isInCart ? const Icon(Icons.check, semanticLabel: 'ADDED') : const Text('ADD'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.displayLarge),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).pushNamed(MyCart.routeName),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Item item;

  const _MyListItem(this.item);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
