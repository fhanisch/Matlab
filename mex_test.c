// cl mex_test.c /I"C:\Program Files\MATLAB\R2018a\extern\include" /link libmex.lib /libpath:"C:\Program Files\MATLAB\R2018a\extern\lib\win64\microsoft" /DLL /out:mexTest.mexw64

#include <matrix.h>

__declspec(dllexport) void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	mexPrintf("\n\t *** HalliHallo ***\n");
}