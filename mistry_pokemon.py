#!/usr/bin/python
import sys
from random import randint
from PIL import Image


image_location = sys.argv[1]
img = Image.open(image_location)

folder_address = image_location[0:image_location.rindex('/')]
folder_address = folder_address[0:folder_address.rindex('/')]

background_image = Image.open(folder_address + '/background_frame2.png')

img = img.convert("RGBA")
datas = img.getdata()
newData = []
#R,G,B = randint(0,255), randint(0,255), randint(0,255) 
for item in datas:
  if item[3]:
    newData.append((0, 0, 0, 255))
  else:
    newData.append((0, 0, 0, 0))
background_image.paste(img, (0, 0), img)
background_image.save(folder_address + "/actual_pokemon.png", "PNG")
img.putdata(newData)
background_image.paste(img, (0, 0), img) 
background_image.save(folder_address + "/mistry_pokemon.png", "PNG")
