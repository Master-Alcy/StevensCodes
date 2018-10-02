//Jingxuan Ai
#include <iostream>
using namespace std;

int main(){
    int n=0;
    int fac=1;
    cout<<"Read in number for factorial";
    cin>>n;
    for(int i=1;i<=n;i++){
        fac=fac*i;
    }
    cout<<"\n"<<"The result is "<<fac;
}