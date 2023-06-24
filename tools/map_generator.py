import random

def generate_random_map(width, height):
    elements = ['*', '=', '⛰️', '🌲']
    map_data = []
    
    for _ in range(height):
        row = []
        for _ in range(width):
            element = random.choice(elements)
            row.append(element)
        map_data.append(row)
    
    return map_data

# 生成地图
map_width = 30
map_height = 20
map_data = generate_random_map(map_width, map_height)

# 打印地图
for row in map_data:
    for element in row:
        print(element, end=' ')
    print()
