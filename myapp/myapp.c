#include <pjsua-lib/pjsua.h>
#include <pj/log.h>

int main()
{
   pj_status_t status;

   status = pjsua_create();
   PJ_LOG(3,("myapp.c", "Hello PJSIP! Bye PJSIP."));
   pjsua_destroy();
   return 0;
}
