import xml.etree.ElementTree as ET

# Manually specify the XML file names
xml_files = [
    'EPG/epg-tv-ce-soir-fr.xml',
    'EPG/epg-nos-tv-pt.xml',
    'EPG/epg-mitv-br.xml'
    'EPG/epg-magentatv-de.xml'
    'EPG/epg-iltalehti-fi.xml'
]

# Create a root element for the new XML file
root = ET.Element("Root")

# Check if any XML files are provided
if not xml_files:
    print("No XML files specified. Exiting.")
else:
    for filename in xml_files:
        print(f"Processing {filename}...")
        try:
            tree = ET.parse(filename)
            root_element = tree.getroot()
            
            # Print the root element and its children
            print(f"Root element: {ET.tostring(root_element, encoding='unicode')}")
            print(f"Number of children in {filename}: {len(root_element)}")
            
            # Append all children of the root element
            for child in root_element:
                print(f"Appending child: {ET.tostring(child, encoding='unicode')}")
                root.append(child)

        except ET.ParseError as e:
            print(f"Error parsing {filename}: {e}")
        except FileNotFoundError:
            print(f"Error: {filename} not found.")
        except Exception as e:
            print(f"An error occurred with {filename}: {e}")

    # Write the new XML tree to a file
    new_tree = ET.ElementTree(root)
    new_tree.write("epg-rodri.xml", encoding="utf-8", xml_declaration=True)

    print("Combined XML has been created as epg-rodri.xml")
