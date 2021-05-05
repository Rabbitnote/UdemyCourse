import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilter;
  final Map<String, bool> currentFilter;
  Filter(this.currentFilter, this.saveFilter);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState() {
    super.initState();
    // print(widget.currentFilter.toString());
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];

    
  }

  Widget _buildSwitchTile(
      bool value, String title, String subtitle, Function update) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subtitle),
        onChanged: update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDraw(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };

              widget.saveFilter(selectedFilter);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Section',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                    _glutenFree, 'Gluten', 'Only Inculde Gluten-Free meal',
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    _lactoseFree, 'Lactose', 'Only Inculde Lactose meal',
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    _vegetarian, 'Vegetarian', 'Only Inculde Vegetarian meal',
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTile(_vegan, 'Vegan', 'Only Inculde Vegan meal',
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
