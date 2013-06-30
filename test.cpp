#include <iostream>
using  namespace std;
void dectobin(unsigned short int num)
{
    unsigned int powerOf2=0x8000;
        while (powerOf2!=0)
	    {
	            if (num>=powerOf2)
		            {
			                num^=powerOf2;  //Equivalent to num-= powerOf2;
					            cout<<1;
						            }
							            else
								                cout<<0;
										        powerOf2=powerOf2>>1;
											    }
											    }


int  main()
{dectobin(35);
cout << endl;
return 0;
}
