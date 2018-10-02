//Jingxuan Ai
#include <iostream>
using namespace std;

int main(){
    int n=100;
    int s=0;
    cout<<"There are ";
    cout<<n;
    cout<<" numbers, applying formula";
    s=n*(n+1)/2;
    cout<<"\n";
    cout<<"The result is ";
    cout<<s<<"\n";
    
    n=100;
    s=0;
    cout<<"There are ";
    cout<<n;
    cout<<" numbers, using loop";
    cout<<"\n";
    for (int i=1;i<101;i++){
        s=s+i;
    }
    cout<<"The result is ";
    cout<<s<<"\n"<<"5050=5050, both answers are the same.";
}
