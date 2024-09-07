//
// Created by Timothy Coelho on 9/7/24.
//

#include <iostream>

extern "C"
{
	void add_numbers(int* a, int* b, int* result);
	void print_invoke(int* a);
	void print_array(double* arr, int* sz);
}

int main()
{
	int x = 5;
	int y = 7;
	int sum = 0;

	double arr[] = {5.5435, 6.23432, 7.1231, 8.34435, 9.5353, 1.2342 ,1.111 , 2.001, 3.4141, 4.234, 5.123, 6.123, 7.1, 8.6};
	int sz = sizeof(arr) / sizeof(double);

	add_numbers(&x, &y, &sum);

	std::cout << "Sum: " << sum << '\n';

	print_invoke(&x);
	print_array(arr, &sz);

	return 0;
}