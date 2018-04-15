// cl /nologo /I"C:\Program Files\MATLAB\R2018a\extern\include" mat_test.c /link /libpath:"C:\Program Files\MATLAB\R2018a\extern\lib\win64\microsoft" /out:mat_text.exe libmx.lib libmat.lib

#include <stdio.h>
#include <mat.h>

int main(int argc, char *argv[])
{
	MATFile *pmat;
	mxArray *pa1;
	double data[9] = { 1.0, 4.0, 7.0, 2.0, 5.0, 8.0, 3.0, 6.0, 9.0 };
	int status;
	const char *file = "mattest.mat";

	printf("Create mat-File:\n\n");
	pmat = matOpen(file, "w");
	if (pmat == NULL)
	{
		printf("Fuck!\n");
		return -1;
	}
	pa1 = mxCreateDoubleMatrix(1, 9, mxREAL);
	if (pa1 == NULL)
	{
		printf("Fuck!\n");
		return -1;
	}
	memcpy((void *)(mxGetPr(pa1)), (void *)data, sizeof(data));

	status = matPutVariable(pmat, "x_data", pa1);
	if (status != 0) {
		printf("Fuck!\n");
		return -1;
	}

	mxDestroyArray(pa1);

	if (matClose(pmat) != 0)
	{
		printf("Error closing file %s\n", file);
		return -1;
	}

	return 0;
}