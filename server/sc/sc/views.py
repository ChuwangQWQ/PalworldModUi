from django.http import HttpResponse
from django.shortcuts import render
import os
import loader
import configparser
from time import sleep
import json
import shutil

def copy_file(src, dst):
    print(f"Copied {src} to {dst}")
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    shutil.copy2(src, dst)

def walks(path):
    result = []
    for root, dirs, files in os.walk(path):
        for file in files:
            result.append(os.path.join(root, file))
    return result

def f5():
    pack = {}
    enablePacks = os.listdir("server\\embMods")
    allPacks = os.listdir("server\\allmods")
    for pak in enablePacks:
        pack[pak] = 'true'
    for pak in allPacks:
        if not pak in pack.keys():
            pack[pak] = 'false'
    with open("mods.json", "w") as f:
        f.write(json.dumps(pack))

def getConfig():
    try:
        config = configparser.ConfigParser()
        config.read("config.ini")
        path = config.get('config', 'gamepath')
        return path
    except:
        pass

def res(directory):
    for f in walks(directory):
        if f != 'Pal-Windows.pak':
            os.remove(f)
    if directory== f'{getConfig()}\\Pal\Content\Paks':
        try:
            os.rmdir(directory)
        except:
            pass

def getMods():
    with open("mods.json", "r") as f:
        return json.loads(f.read())

def disableMod(Mod):
    os.system(f'del /q "{os.path.abspath("server\\embmods\\"+Mod)}"')
    with open("mods.json", "r") as f:
        data = json.load(f)
    data[Mod] = 'false'
    with open("mods.json", "w") as f:
        f.write(json.dumps(data))

def enableMod(Mod):
    os.system(f'copy /y "{os.path.abspath("server\\allmods\\"+Mod)}" "{os.path.abspath("server\\embmods\\"+Mod)}"')
    with open("mods.json", "r") as f:
        data = json.load(f)
    data[Mod] = 'true'
    with open("mods.json", "w") as f:
        f.write(json.dumps(data))

def upMod():
    res(f'{getConfig()}\\Pal\Content\Paks')
    res(f'{getConfig()}\\Pal\Binaries\Win64\Mods')
    mods = walks(os.path.abspath('server\\allmods'))
    for f in mods:
        a, b = os.path.splitext(f)
        if b == '.lua' or b == '.txt':
            copy_file(f, f'{getConfig()}\\Pal\\Binaries\\Win64\\Mods\\{f.replace(os.path.abspath("server\\allmods"), "")}')
        else:
            copy_file(f, f'{getConfig()}\\Pal\\Binaries\\Win64\\Mods\\{f.replace(os.path.abspath("server\\allmods"), "")}')
            copy_file(f, f'{getConfig()}\\Pal\Content\Paks\\{f.replace(os.path.abspath("server\\allmods"), "")}')

def downloadMod():
    files = walks(f'{getConfig()}\\Pal\Binaries\Win64\Mods')
    files2 = []
    for f in range(len(files)):
        q = files[f-1].replace(getConfig()+'\\Pal\\Binaries\\Win64\Mods', '')
        files2.append(os.path.abspath(f'server\\allmods{q}'))
    packs = walks(f'{getConfig()}\\Pal\Content\Paks\Mods')
    packs2 = []
    for f in range(len(packs)):
        q = packs[f-1].replace(getConfig()+'\\Pal\\Content\\Paks\\Mods', '')
        if q != 'Pal-Windows.pak':
            packs2.append(os.path.abspath(f'server\\allmods{q}'))
    for src, dst in zip(files, files2):
        copy_file(src, dst)
    for src, dst in zip(packs, packs2):
        copy_file(src, dst)
    f5()

def hello(request):
    thing = request.GET.get('type')
    mod = request.GET.get('mod')
    sc = request.GET.get('sc')
    path = request.GET.get('path')
    dicts = getMods()
    dicts = str(dicts).replace('{','').replace('}','').replace("'",'')
    if sc == 'helper':
        return render(request, "helper.html")
    elif sc == 'download':
        try:
            times = loader.download(getConfig()+'\\Pal\\Binaries\\Win64')
            return render(request, "index.html", {"files": dicts,"path":getConfig(),"error":times})
        except:
            return render(request, "index.html", {"files": dicts,"error":"game path error","path":getConfig()})
    elif sc == 'sc':
        try:
            upMod()
            return render(request, "index.html", {"files": dicts,"path":getConfig(),"error":"Done!"})
        except:
            return render(request, "index.html", {"files": dicts,"error":"game path error","path":getConfig()})
    elif sc == 'xz':
        try:
            downloadMod()
            return render(request, "index.html", {"files": dicts,"path":getConfig(),"error":"Done!"})
        except:
            return render(request, "index.html", {"files": dicts,"error":"game path error","path":getConfig()})
    elif sc == 'f5':
        f5()

    if mod != '' and mod != None:
        if thing == 'true':
            enableMod(mod)
        elif thing == 'false':
            disableMod(mod)

    if not path == None and not path == '':
        try:
            if 'Palworld.exe' in os.listdir(path):
                config = configparser.ConfigParser()
                config.add_section('config')
                config.set('config', 'gamepath', path)
                with open(r"config", 'w') as f:
                    config.write(f)
                return render(request, "index.html", {"files": dicts,"path":getConfig()})
            else:
                return render(request, "index.html", {"files": dicts,"error":"game path error","path":getConfig()})
        except:
            return render(request, "index.html", {"files": dicts,"error":"game path error","path":getConfig()})
    return render(request, "index.html", {"files": dicts,"path":getConfig()})