import xml.etree.ElementTree as ET
import glob

# Create a root element for the new XML file
root = ET.Element("Root")

# Read all XML files in the current directory
for filename in glob.glob("*.xml"):
    tree = ET.parse(filename)
    root_element = tree.getroot()
    
    # Append each root element of the input files to the new root
    for child in root_element:
        root.append(child)

# Write the new XML tree to a file
new_tree = ET.ElementTree(root)
new_tree.write("combined.xml", encoding="utf-8", xml_declaration=True)


