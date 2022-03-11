#include "Python.h"

int main()
{   
    PyObject *pModuleName, *pModule;
    PyObject *pFunc, *pythonArgument;
    PyObject *pValue;

    char *msg = "Hello World!";
    char *ss = "lo";

    setenv("PYTHONPATH","./python_modules",1);
    
	Py_Initialize();

	pModuleName = PyUnicode_DecodeFSDefault("my_module");
    if (pModuleName == NULL) {
        fprintf(stderr, "pModuleName is null.\n");
        return 0;
    }
    pModule = PyImport_Import(pModuleName);

    if (pModule != NULL) {
        pythonArgument = PyTuple_New(1);
        if (pythonArgument == NULL) {
            fprintf(stderr, "pythonArgument is null.\n");
            return 0;
        }

        pValue = PyUnicode_DecodeFSDefault(msg);
        if (pValue == NULL) {
            fprintf(stderr, "pValue is null.\n");
            return 0;
        }

        if (PyTuple_SetItem(pythonArgument, 0, pValue) < 0) {
            fprintf(stderr, "PyTuple_SetItem failed.\n");
            return 0;
        }

        pFunc = PyObject_GetAttrString(pModule, "say");
        if (pFunc == NULL) {
            fprintf(stderr, "pFunc is null.\n");
            return 0;
        }
        PyObject_CallObject(pFunc, pythonArgument);

        Py_DECREF(pFunc);
        Py_DECREF(pythonArgument);

        /**
         *  TODO - Apelați funcția creată de voi din modulul my_module.py
         *  și afișați un mesaj corespunzător în funcție de rezultat.
         */
        
        pythonArgument = PyTuple_New(2);
        if (pythonArgument == NULL) {
            fprintf(stderr, "pythonArgument is null.\n");
            return 0;
        }

        pValue = PyUnicode_DecodeFSDefault(msg);
        if (pValue == NULL) {
            fprintf(stderr, "pValue is null.\n");
            return 0;
        }

        if (PyTuple_SetItem(pythonArgument, 0, pValue) < 0) {
            fprintf(stderr, "PyTuple_SetItem failed.\n");
            return 0;
        }

        pValue = PyUnicode_DecodeFSDefault(ss);
        if (pValue == NULL) {
            fprintf(stderr, "pValue is null.\n");
            return 0;
        }

        if (PyTuple_SetItem(pythonArgument, 1, pValue) < 0) {
            fprintf(stderr, "PyTuple_SetItem failed.\n");
            return 0;
        }

        pFunc = PyObject_GetAttrString(pModule, "subsir");
        if (pFunc == NULL) {
            fprintf(stderr, "pFunc is null.\n");
            return 0;
        }
        PyObject *pres = PyObject_CallObject(pFunc, pythonArgument);

        int x = PyLong_AsLong(pres);
        //printf("%d\n\n\n", x);
        if (x != -1)
            printf("%s", msg + x);
        else
            printf("Nu exista acest subsir\n");
        Py_DECREF(pFunc);
        Py_DECREF(pythonArgument);
        Py_DECREF(pres);
    } else {
        fprintf(stderr, "pModule is null.\n");
        return 0;
    }

    Py_DECREF(pModuleName);
    Py_DECREF(pModule);

	Py_Finalize();

    return 0;
}
