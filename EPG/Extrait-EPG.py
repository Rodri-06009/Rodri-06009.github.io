import lzma
import xml.etree.ElementTree as ET
import os

# Dossier contenant les fichiers .xml.xz
dossier = os.path.expanduser('../EPG/')

# Parcours de tous les fichiers dans le dossier
for nom_fichier in os.listdir(dossier):
    if nom_fichier.endswith('.xml.xz'):
        chemin_fichier = os.path.join(dossier, nom_fichier)
        
        # Décompression du fichier .xml.xz
        with lzma.open(chemin_fichier) as fichier:
            contenu_xml = fichier.read()
        
        # Parsing du contenu XML
        racine = ET.fromstring(contenu_xml)
        
        # Exemple : affichage des balises de la racine
        print(f"Fichier : {nom_fichier}")
        for enfant in racine:
            print(enfant.tag, enfant.attrib)
