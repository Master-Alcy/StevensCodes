//Jingxuan Ai
#include <iostream>
using namespace std;

int main(){
    int n=5;
    cout<<"suppose n=5\n";
    cout<<n;
    cout<<" ";
    while(n!=1){
        if (n%2==0){
            n=n/2;
        }
        else {
            n=3*n+1;
        }
        cout<<n;
        cout<<" ";
    }
}