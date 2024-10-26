import xml.etree.ElementTree as ET
import glob

# Create a root element for the new XML file
root = ET.Element("Root")

# Find all XML files in the current directory
xml_files = glob.glob("*.xml")
print(f"Found {len(xml_files)} XML files.")

# Check if any XML files are found
if not xml_files:
    print("No XML files found. Exiting.")
else:
    for filename in xml_files:
        print(f"Processing {filename}...")
        try:
            tree = ET.parse(filename)
            root_element = tree.getroot()
            
            # Check if the root element has children
            if len(root_element) == 0:
                print(f"Warning: {filename} has no children.")
            else:
                for child in root_element:
                    print(f"Appending child: {ET.tostring(child, encoding='unicode')}")
                    root.append(child)

        except ET.ParseError as e:
            print(f"Error parsing {filename}: {e}")
        except Exception as e:
            print(f"An error occurred with {filename}: {e}")

    # Write the new XML tree to a file
    new_tree = ET.ElementTree(root)
    new_tree.write("combined.xml", encoding="utf-8", xml_declaration=True)

    print("Combined XML has been created as combined.xml")
