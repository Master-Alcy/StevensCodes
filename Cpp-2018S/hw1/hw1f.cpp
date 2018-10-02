//Jingxuan Ai
#include <iostream>
#include <cmath>
using namespace std;

int main(){
    float n=1;
    float sum=0;
    float d1=0;
    float d2=0;
    float d=1;
    float s1=0;
    float s2=0;
    while (d!=0){
        d1=sum;
        sum=sum+1/(n*n);
        n++;
        d2=sum;
        d=d2-d1;
    }
    s1=sqrt(6*sum);
    cout<<"When n no longer matters, sum is "<<sum<<", n is "<<n<<", and s is "<<s1<<".\n";
    cout<<"Assume forward means sum1=1/1^2+1/2^2+1/3^2+...+1/n^2"<<"\n"<<"And backward means sum2=1/n^2+...+1/3^2+1/2^2+1/1^2"<<"\n";
    cout<<"Also by make n bigger I would make n+902=5000"<<"\n";
    sum=0.0;
    for (float i=1; i<=5000;i++){
        sum=sum+1/(i*i);
        s1=sqrt(6*sum);
    }
    sum=0.0;
    for (float i=5000; i>=1;i--){
        sum=sum+1/(i*i);
        s2=sqrt(6*sum);
    }
    cout<<"As a result, s1 is "<<s1<<", and s2 is "<<s2<<".";
}