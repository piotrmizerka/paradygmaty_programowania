import re
import unicodedata

import unicodedata

def normalize(city):
    city = city.strip()

    # 🔥 manual replacements FIRST
    replacements = {
        'ł': 'l', 'Ł': 'L',
        'ą': 'a', 'Ą': 'A',
        'ć': 'c', 'Ć': 'C',
        'ę': 'e', 'Ę': 'E',
        'ń': 'n', 'Ń': 'N',
        'ó': 'o', 'Ó': 'O',
        'ś': 's', 'Ś': 'S',
        'ż': 'z', 'Ż': 'Z',
        'ź': 'z', 'Ź': 'Z'
    }

    for k, v in replacements.items():
        city = city.replace(k, v)

    # normalize (just in case)
    city = unicodedata.normalize('NFD', city)
    city = ''.join(c for c in city if not unicodedata.combining(c))

    return city.lower().replace(' ', '_')

def parse_roads(file_path):
    with open(file_path, encoding="utf-8") as f:
        content = f.read()

    raw_roads = re.split(r'\n\s*\n', content)

    roads = []
    for road in raw_roads:
        road = road.replace('\n', '').strip()

        if not road:
            continue

        road = road.strip('-')

        cities = [c.strip() for c in road.split('-') if c.strip()]

        if len(cities) > 1:
            roads.append(cities)

    return roads


def generate_edges(roads):
    edges = set()

    for road in roads:
        for i in range(len(road) - 1):
            a = normalize(road[i])
            b = normalize(road[i + 1])

            edges.add((a, b))
            edges.add((b, a))

    return edges


def save_prolog(edges, output_file):
    with open(output_file, "w", encoding="utf-8") as f:
        for a, b in sorted(edges):
            f.write(f"edge({a}, {b}).\n")


if __name__ == "__main__":
    roads = parse_roads("roads.txt")
    edges = generate_edges(roads)
    save_prolog(edges, "roads.pl")