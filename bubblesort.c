#include <stdio.h>
// reference c program for bubble sort

int main(){
    int sortarray[10] = {89, 63, -55, -107, 42, 98, -425, 203, 0, 303}; // starts at 0x400
}

// 1024 stores to address 0x400
// program variables go to s0-s11
// other values in t0-t6

void bubble_sort(int array[], int size){

    int temp;
    for(int i = 0; i < size - 1; i++){
        for(int j = 0; j < size - i - 1; j++){
            if(array[j] > array[j + 1]){
                temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}