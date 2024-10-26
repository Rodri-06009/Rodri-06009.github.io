import os
import gzip
import shutil

# Répertoire contenant les fichiers .xml.gz
directory = '/home/Rodri-06009/EPG-Rodri/EPG'

# Liste des fichiers à décompresser
files_to_decompress = [
    'epg-tv-ce-soir-fr.xml.gz',
    'epg-nos-tv-pt.xml.gz',
    'epg-mitv-br.xml.gz',
    'epg-magentatv-de.xml.gz',
    'epg-iltalehti-fi.xml.gz'
]

for file_name in files_to_decompress:
    file_path = os.path.join(directory, file_name)
    
    if os.path.exists(file_path):
        # Décompression du fichier
        with gzip.open(file_path, 'rb') as f_in:
            with open(file_path[:-3], 'wb') as f_out:  # Enlève '.gz' pour le nom de fichier
                shutil.copyfileobj(f_in, f_out)
        print(f'Décompression réussie : {file_path}')
    else:
        print(f'Erreur : {file_path} n\'existe pas.')

print("Processus terminé.")
