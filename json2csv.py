import json
import csv
import os

# Function to convert a single JSON file to CSV
def json_to_csv(json_file, csv_file):
    with open(json_file, 'r') as f:
        data = json.load(f)

    # Open a CSV file for writing
    with open(csv_file, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)

        # Write the header
        writer.writerow(['Subkey', 'Acc', 'Acc_Norm'])

        # Iterate through the 'results' subkeys
        for subkey, values in data['results'].items():
            # Extract 'acc' and 'acc_norm' values
            acc = values.get('acc')
            acc_norm = values.get('acc_norm')

            # Write the row to the CSV file
            writer.writerow([subkey, acc, acc_norm])

# Function to recursively find all JSON files and convert them
def convert_all_json_to_csv(root_dir):
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.json'):
                json_file_path = os.path.join(dirpath, filename)
                csv_file_path = os.path.join(dirpath, filename.replace('.json', '.csv'))

                # Convert the JSON file to CSV
                json_to_csv(json_file_path, csv_file_path)
                print(f"Converted: {json_file_path} -> {csv_file_path}")

# Start the conversion process from the current directory
convert_all_json_to_csv(os.getcwd())
