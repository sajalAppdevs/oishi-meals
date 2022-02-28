import 'package:flutter/material.dart';
import '../models/filters.dart';
import '../utils/strings.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = "/filters";

  final Function(Filters filters) _updateFilters;
  final Filters _filters;

  const FiltersScreen(this._filters, this._updateFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late var _filters = widget._filters;

  Widget _buildListTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (val) => setState(() => updateValue(val)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(filters),
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: theme.textTheme.headline3,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildListTile(
                "Gluten-Free",
                "Only include gluten-free meals",
                _filters.glutenFree,
                (val) => _filters = _filters.copy(glutenFree: val),
              ),
              _buildListTile(
                "Lactose-Free",
                "Only include lactose-free meals",
                _filters.lactoseFree,
                (val) => _filters = _filters.copy(lactoseFree: val),
              ),
              _buildListTile(
                "Vegan",
                "Only include vegan meals",
                _filters.vegan,
                (val) => _filters = _filters.copy(vegan: val),
              ),
              _buildListTile(
                "Vegetarian",
                "Only include vegetarian meals",
                _filters.vegetarian,
                (val) => _filters = _filters.copy(vegetarian: val),
              ),
            ],
          ))
        ],
      )),
    );
  }

  @override
  void dispose() {
    widget._updateFilters(_filters);
    super.dispose();
  }
}
