class Filters {
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;
  final bool vegetarian;

  Filters({
    this.glutenFree = false,
    this.lactoseFree = false,
    this.vegan = false,
    this.vegetarian = false,
  });

  Filters copy({
    bool? glutenFree,
    bool? lactoseFree,
    bool? vegan,
    bool? vegetarian,
  }) {
    return Filters(
      glutenFree: glutenFree ?? this.glutenFree,
      lactoseFree: lactoseFree ?? this.lactoseFree,
      vegan: vegan ?? this.vegan,
      vegetarian: vegetarian ?? this.vegetarian,
    );
  }
}
