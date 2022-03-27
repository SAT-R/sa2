extern void sub_8001404(void);
extern void sub_801A51C(void);
extern char gUnknown_0300188C;

extern int gUnknown_03001840;
extern int gUnknown_03001884;
extern int gUnknown_03004D54;
extern int gUnknown_030022C0;
extern int gUnknown_030022AC;

extern int gUnknown_03004D90;
extern char gUnknown_03004D50;

void sub_8002450(void) {
  int local_c;
  
  gUnknown_0300188C = 0;
  
  gUnknown_03001840 = gUnknown_03001840 & 0xfffffff7;
  if ((gUnknown_03001840 & (0x20)) == 0) {
    if (gUnknown_03001884 == gUnknown_03004D54) {
      gUnknown_03001884 = gUnknown_030022C0;
      gUnknown_030022AC = gUnknown_03004D54;
    }
    else {
      gUnknown_03001884 = gUnknown_03004D54;
      gUnknown_030022AC = gUnknown_030022C0;
    }
  }
  gUnknown_03001840 = gUnknown_03001840 & 0xfffffffb;
  local_c = 0x200;
  CpuFastSet(&local_c, &gUnknown_03004D90, 0x1000100);
  gUnknown_03004D50 = 0;
  gUnknown_03001840 = gUnknown_03001840 & 0xffffffef;
}

void AgbMain(void) {
    sub_8001404();
    sub_801A51C();
    MainLoop();
}
