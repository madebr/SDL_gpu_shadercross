/*
  Simple DirectMedia Layer Shader Cross Compiler
  Copyright (C) 2024 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

#include "SDL_gpu_shadercross.h"
#include "stdio.h"

void print_help()
{
   fprintf(stdout, "%s", "Usage: shadercross input_file [options]\n");
}

int main(int argc, char *argv[])
{
   if (argc < 2)
   {
      print_help();
      return 1;
   }

   if (!SDL_ShaderCross_Init())
   {
      fprintf(stderr, "%s", "Failed to initialize shadercross!");
      return 1;
   }

   SDL_ShaderCross_Quit();
   return 0;
}
