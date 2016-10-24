#!/usr/bin/python

import os
from PIL import Image
old_folder = "./6gen"
new_folder = "./gen6"
png_files = os.listdir(old_folder)
size = 250, 250
#put png_files
for png_file in png_files:
  print(png_file)
  #if os.path.exists('pokemon_z/' + png_file): continue
  extension = png_file[-4:]
  if extension != '.png': continue

  im = Image.open(old_folder + '/' + png_file)

  # width, height = im.size
  # if width>500:
  #   width = int(width/5)
  #   height = int(height/5)
  # im = im.resize((width,height), Image.ANTIALIAS)
  im.thumbnail(size, Image.ANTIALIAS)
  im.save( new_folder + '/' + png_file)
