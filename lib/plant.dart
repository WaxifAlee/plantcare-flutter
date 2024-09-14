class Plant {
  final String pId;
  final String name;
  final String species;
  final String description;
  final String imageUrl;
  final int waterFrequency;
  final String lastWatered;

  Plant({
    required this.pId,
    required this.name,
    required this.species,
    required this.description,
    required this.imageUrl,
    required this.waterFrequency,
    required this.lastWatered,
  });
}

final List<Plant> plantsList = [
  Plant(
    pId: "p_monstera",
    name: "Monstera",
    species: "Monstera deliciosa",
    description:
        "A popular indoor plant with large, glossy leaves. It is known for its unique split leaves and is often used in interior decor. Monstera is relatively easy to care for and thrives in bright, indirect light. Regular watering and occasional fertilizing will keep this plant healthy.",
    imageUrl: "../assets/monstera.jpg",
    waterFrequency: 7,
    lastWatered: "2023-05-20",
  ),
  Plant(
    pId: "p_snake_plant",
    name: "Snake Plant",
    species: "Sansevieria trifasciata",
    description:
        "An easy-to-care-for plant with upright, sword-like leaves. Snake plants are known for their air-purifying qualities and can tolerate low light conditions. They require minimal watering and are very resilient, making them perfect for beginners. They can grow in a variety of light conditions.",
    imageUrl: "../assets/snakeplant.jpg",
    waterFrequency: 14,
    lastWatered: "2023-05-18",
  ),
  Plant(
    pId: "p_fiddle_leaf",
    name: "Fiddle Leaf Fig",
    species: "Ficus lyrata",
    description:
        "A trendy plant known for its large, violin-shaped leaves. Fiddle leaf figs are popular for their dramatic foliage and can make a statement in any room. They prefer bright, indirect light and should be watered when the top inch of soil is dry. This plant can be sensitive to changes in its environment.",
    imageUrl: "../assets/fiddle_leaf.jpg",
    waterFrequency: 10,
    lastWatered: "2023-05-19",
  ),
  Plant(
    pId: "p_aloe_vera",
    name: "Aloe Vera",
    species: "Aloe barbadensis miller",
    description:
        "A succulent plant known for its medicinal properties. Aloe vera gel is commonly used to treat burns and skin irritations. This plant prefers bright, sunny locations and should be watered deeply but infrequently, allowing the soil to dry out between waterings. It's a great addition to any kitchen or bathroom window.",
    imageUrl: "../assets/aloevera.jpg",
    waterFrequency: 21,
    lastWatered: "2023-05-15",
  ),
  Plant(
    pId: "p_spider_plant",
    name: "Spider Plant",
    species: "Chlorophytum comosum",
    description:
        "A resilient plant with long, arching leaves. Spider plants are known for their ability to produce 'babies' or plantlets that can be propagated. They thrive in bright to moderate indirect light and prefer to dry out a bit between waterings. Spider plants are great for hanging baskets.",
    imageUrl: "../assets/spiderplant.jpg",
    waterFrequency: 7,
    lastWatered: "2023-05-22",
  ),
  Plant(
    pId: "p_peace_lilly",
    name: "Peace Lily",
    species: "Spathiphyllum",
    description:
        "A beautiful plant known for its white flowers. Peace lilies thrive in low to bright indirect light and are known for their air-purifying qualities. They prefer to be kept moist but not soggy and will wilt when they need water, bouncing back quickly after a good drink. They are also pet-friendly plants.",
    imageUrl: "../assets/peace_lilly.jpg",
    waterFrequency: 14,
    lastWatered: "2023-05-21",
  ),
  Plant(
    pId: "p_zz_plant",
    name: "ZZ Plant",
    species: "Zamioculcas zamiifolia",
    description:
        "A hardy plant with waxy, dark green leaves. ZZ plants are extremely low maintenance and can tolerate low light and infrequent watering. They are perfect for office spaces or rooms with minimal natural light. ZZ plants can thrive on neglect and are very resilient to pests and diseases.",
    imageUrl: "../assets/zz_plant.jpg",
    waterFrequency: 30,
    lastWatered: "2023-05-01",
  ),
  Plant(
    pId: "p_rubber_plant",
    name: "Rubber Plant",
    species: "Ficus elastica",
    description:
        "A popular indoor tree with broad, shiny leaves. Rubber plants can grow quite tall and prefer bright, indirect light. They need to be watered when the top inch of soil is dry and benefit from occasional leaf wiping to remove dust. This plant is a great focal point in any living space.",
    imageUrl: "../assets/rubber_plant.jpg",
    waterFrequency: 10,
    lastWatered: "2023-05-20",
  ),
  Plant(
    pId: "p_boston_fern",
    name: "Boston Fern",
    species: "Nephrolepis exaltata",
    description:
        "A lush, green plant with feathery fronds. Boston ferns thrive in high humidity and indirect light. They require regular watering to keep the soil moist but not soggy. These ferns are excellent for hanging baskets and can add a touch of elegance to any room. They also help in improving air quality.",
    imageUrl: "../assets/boston_fern.jpg",
    waterFrequency: 7,
    lastWatered: "2023-05-19",
  ),
  Plant(
    pId: "p_pothos",
    name: "Pothos",
    species: "Epipremnum aureum",
    description:
        "A versatile plant with heart-shaped leaves. Pothos are easy to grow and can thrive in a variety of light conditions, from low to bright indirect light. They are very forgiving and can tolerate occasional neglect. Pothos can be grown in soil or water and are great for hanging baskets or climbing up a trellis.",
    imageUrl: "../assets/pothos.jpg",
    waterFrequency: 7,
    lastWatered: "2023-05-22",
  ),
];
