//Jingxuan Ai
#include <iostream>
using namespace std;

int main(){
    float sum1f=0;
    double sum1d=0;
    float sum2f=0;
    double sum2d=0;
    float a=1;
    float c=100;
    float x=1;
    double b=1;
    double d=100;
    double y=1;
    float sumf=0;
    double sumd=0;
    
    for(int i=1;i<101;i++){
        sum1f=sum1f+x/a;
        a++;
    }
     for(int i=1;i<101;i++){
        sum1d=sum1d+y/b;
        b++;
    }
    cout<<"sum1 of floats: ";
    cout<<sum1f;
    cout<<"\n";
    cout<<"sum1 of doubles: ";
    cout<<sum1d;
    cout<<"\n";
    
    for(int i=1;i<101;i++){
        sum2f=sum2f+x/c;
        c--;
    }
     for(int i=1;i<101;i++){
        sum2d=sum2d+y/d;
        d--;
    }
    cout<<"sum2 of floats: ";
    cout<<sum2f;
    cout<<"\n";
    cout<<"sum2 of doubles: ";
    cout<<sum2d;
    cout<<"\n";
    
    sumf=sum1f-sum2f;
    sumd=sum1d-sum2d;
    cout<<"sum1-sum2 for float is";
    cout<<"\n";
    cout<<sumf;
    cout<<"\n";
    cout<<"sum1-sum2 for double is";
    cout<<"\n";
    cout<<sumd;
}