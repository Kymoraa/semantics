class Cakes {
  final String cakeName;
  final String cakeImageUrl;
  final String currentPrice;

  const Cakes({required this.cakeName, required this.cakeImageUrl, required this.currentPrice});
}

// list of flowers
final cakes = [
  const Cakes(
    cakeName: "Chocolate",
    cakeImageUrl: "https://sallysbakingaddiction.com/wp-content/uploads/2017/06/moist-chocolate-cupcakes-5.jpg",
    currentPrice: "450",
  ),
  const Cakes(
    cakeName: "Red Velvet",
    cakeImageUrl: "https://www.rainbownourishments.com/wp-content/uploads/2023/02/vegan-red-velvet-cupcakes-1.jpg",
    currentPrice: "392",
  ),
  const Cakes(
    cakeName: "Oreo",
    cakeImageUrl: "https://www.barleyandsage.com/wp-content/uploads/2022/08/oreo-cupcakes-1200x1200-1.jpg",
    currentPrice: "380",
  ),
  const Cakes(
    cakeName: "Vanilla",
    cakeImageUrl: "https://www.dessertfortwo.com/wp-content/uploads/2022/02/Small-Batch-Vanilla-Cupcakes-5.jpg",
    currentPrice: "250",
  ),
  const Cakes(
    cakeName: "Salted Caramel",
    cakeImageUrl: "https://inbloombakery.com/wp-content/uploads/2021/09/Almond-Caramel-Cupcakes-18.jpg",
    currentPrice: "250",
  ),
  const Cakes(
    cakeName: "Strawberry",
    cakeImageUrl: "https://lovingitvegan.com/wp-content/uploads/2021/04/Vegan-Strawberry-Cupcakes-18.jpg",
    currentPrice: "380",
  ),
];
