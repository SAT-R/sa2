extern void sub_8001404(void);
extern void sub_801A51C(void);

void AgbMain(void) {
    sub_8001404();
    sub_801A51C();
    MainLoop();
}
