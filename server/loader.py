import os
import zipfile
import urllib.request
import time

def download(extract_dir):
    st = time.time()
    print('Downloading REUE4SS...')
    urllib.request.urlretrieve('https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v3.0.0/UE4SS_v3.0.0.zip', 'temp.zip')
    print('Unzip...')
    with zipfile.ZipFile('temp.zip', 'r') as zip_ref:
        zip_ref.extractall(extract_dir)
    os.remove('temp.zip')
    et = time.time() - st
    print(f'Done!  {str(et)[:5]}sec.')
    return f'Done!  {str(et)[:5]}sec.'