
int main(void)
{
    int i;
    unsigned long long init[4]={0x12345ULL, 0x23456ULL, 0x34567ULL, 0x45678ULL}, length=4;
    init_by_array64(init, length);

    printf("1000 outputs of genrand64_real1()\n");
    for (i=0; i<1000; i++) {
      printf("%12.8f", genrand64_real1());
      if (i%5==4) printf("\n");
    }

    printf("\n1000 outputs of genrand64_real2()\n");
    for (i=0; i<1000; i++) {
      printf("%12.8f", genrand64_real2());
      if (i%5==4) printf("\n");
    }

    printf("\n1000 outputs of genrand64_real3()\n");
    for (i=0; i<1000; i++) {
      printf("%12.8f", genrand64_real3());
      if (i%5==4) printf("\n");
    }

    return 0;
}


