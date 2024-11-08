PJDIR = /home/user/solution/pjproject-2.14.1
include $(PJDIR)/build.mak

myapp: myapp.o
    $(PJ_CC) -o $@ $< $(PJ_LDFLAGS) $(PJ_LDLIBS)

myapp.o: myapp.c
    $(PJ_CC) -c -o $@ $< $(PJ_CFLAGS)

clean:
    rm -f myapp.o myapp
