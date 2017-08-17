#include <stdio.h>
#include <string.h>

extern void play_mym();

//extern void hires();

unsigned char version_opt=0;
unsigned char help_opt=0;

extern char MusicData[];

void version()
{
  printf("mym 0.0.1\n");
}

void usage()
{
  printf("usage:\n");
  printf("mym FILE.mym : ");
  printf("Play a Mym audio file\n\n");
  printf("--help\n");
  printf("--version\n");
  printf("\n\n* Main MYM Player : Dbug (dbug@defence-force.org)\n");
  printf("* Orix port : Jede (jede@oric.org)\n");
  return;
}


unsigned char getopts(char *arg)
{
  // 2: arg is not an option
  if (arg[0]!='-') return 2;
  if (strcmp(arg,"--version")==0 || strcmp(arg,"-v")==0) 
  {
    version_opt=1;
    return 0;
  }
  
  if (strcmp(arg,"--help")==0 || strcmp(arg,"-h")==0) 
  {
    help_opt=1;
    return 0;
  }  

  return 1;
  
}


int main(int argc,char *argv[])
{
  FILE *fp;

  unsigned char i,ret,found_a_folder_in_arg_found=0;

  if (argc==2 || argc==3)
  {
    for (i=1;i<argc;i++)
    {
      ret=getopts(argv[i]);
      if (ret==1) 
      {
        //this is a parameter but not recognized
        usage();
        return 1;
      }
      if (ret==2) 
      {
        //theses are to stop if we have 2 folders on commands line, in the future it will bepossible
        if (found_a_folder_in_arg_found==0) 
            found_a_folder_in_arg_found=1;
        else
          {
          // here we found 2 folders on the command line
          usage();
          return 1;
          }
      }
    }
  }
    else
    {
      usage();
      return 1;
    }

  if (version_opt==1)
  {
    version();
    return 0;
  }
  
  if (help_opt==1)
  {
    usage();
    return 0;
  }  

fp=fopen(argv[1],"r");
if (fp==NULL)  
{
  printf("Can't open %s\n",argv[1]);
  return 0;
}
printf ("This version of mym never stops music and don't catch any keys, please reset to stop\n");
printf("Playing ... %s\n",argv[1]);
fread(&MusicData,17000,1,fp);
play_mym();

	
}
