import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = '/filters-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  initState() {
    isGlutenFree = widget.currentFilters['gluten'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['vegan'];
    isVegetarian = widget.currentFilters['vegeterian'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    BuildContext context, {
    @required String title,
    @required String description,
    @required bool currentItem,
    @required Function changeFunc,
  }) {
    return SwitchListTile(
      value: currentItem,
      onChanged: changeFunc,
      title: Text(title),
      subtitle: Text(description),
      activeColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Screen"),
        actions: [
          IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegeterian': isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(context,
                  title: 'Gluteen-free',
                  description: 'Only include gluteen free meals.',
                  currentItem: isGlutenFree,
                  changeFunc: (nv) => setState(() => isGlutenFree = nv)),
              _buildSwitchListTile(context,
                  title: 'Vegan',
                  description: 'Only include vegan meals.',
                  currentItem: isVegan,
                  changeFunc: (nv) => setState(() => isVegan = nv)),
              _buildSwitchListTile(context,
                  title: 'Vegetarian',
                  description: 'Only include Vegetarian meals.',
                  currentItem: isVegetarian,
                  changeFunc: (nv) => setState(() => isVegetarian = nv)),
              _buildSwitchListTile(context,
                  title: 'Lactose-free',
                  description: 'Only include Lactose free meals.',
                  currentItem: isLactoseFree,
                  changeFunc: (nv) => setState(() => isLactoseFree = nv)),
            ],
          ))
        ],
      ),
    );
  }
}
