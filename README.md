# LP and CP
### Exercises about logic programming (Prolog) and constraint programming (MiniZinc)


## Prolog
You can easily run the Prolog programs using the [online interpreter Swish](https://pengines.swi-prolog.org/apps/swish/).


## MiniZinc
First, you have to [download MiniZinc](https://www.minizinc.org/software.html) and follow the instructions to correctly complete the installation of the software (IDE is not needed).

Then, to run the sudoku solver example (4x4 boxes), you can just type the following command:

```bash
cd minizinc
minizinc sudoku.mzn sudoku_4x4.dzn
```

The files *sudoku_3x3.dzn* or *sudoku_4x4.dzn* are supposed to be edited to provide the input data.
