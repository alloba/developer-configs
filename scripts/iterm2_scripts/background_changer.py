#!/usr/bin/env python3.7

import os
from os import listdir
from os.path import isfile, join, expanduser
import random

import asyncio
import iterm2

'''
This is a script that is meant to bind to a keyboard shortcut. It will randomly change the background image 
of the current session to a random image found within the provided PATH variable below. 

It is meant to be added to iterm2 in the profile > keys section, by adding a script option with the following param: 
`change_image(session_id: id)`

Feel free to change both the path and the supported image files. 
If you feel even more daring, do a recursive walk through the provided directory to search deeper than a single level. 
'''

PATH = expanduser('~') + '/terminal_backgrounds/'
SUPPORTED_FORMATS = ['png', 'jpeg', 'jpg']

async def main(connection):
    app = await iterm2.async_get_app(connection)
    async def get_profile_for_session(session_id):
        session = app.get_session_by_id(session_id)
        return await session.async_get_profile()

    @iterm2.RPC
    async def change_image(session_id):
        profile = await get_profile_for_session(session_id)

        files_first_pass = []
        for root, dirs, files in os.walk(PATH):
            for file in files:
                files_first_pass.append(os.path.join(root, file))
        
        
        background_files = [f for f in files_first_pass if isfile(f) and f.endswith(tuple(SUPPORTED_FORMATS))]
        random_image = random.choice(background_files)
        print(f'Loaded ${random_image} out of a possible ${len(background_files)} options found in ${PATH}, and nested directories.')
        await profile.async_set_background_image_location(random_image)

    await change_image.async_register(connection)

iterm2.run_forever(main)
