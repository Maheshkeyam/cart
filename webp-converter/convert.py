from PIL import Image
import os
import uuid

input_dir = 'images'
output_dir = 'output'

os.makedirs(output_dir, exist_ok=True)

for filename in os.listdir(input_dir):
    if filename.lower().endswith(('.jpg', '.jpeg')):
        input_path = os.path.join(input_dir, filename)
        unique_name = str(uuid.uuid4()) + '.webp'
        output_path = os.path.join(output_dir, unique_name)
        try:
            img = Image.open(input_path).convert('RGB')
            img.save(output_path, 'webp')
            print(f"Converted: {filename} -> {output_path}")
        except Exception as e:
            print(f"Error converting {filename}: {e}")
