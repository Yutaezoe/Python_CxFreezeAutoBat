# Python_CxFreezeAutoBat

## このbatは任意のpythonファイルをcx_Freezeでコンパイルするための補助batです  


### 使い方

1. pipPackages.txt　に依存Packageを記述してください。

1. setup.py にコンパイルしたいpythonファイルを記述してください。

    ``` python
    # script = "main.py"の部分を任意のファイルに置き換えてください
    exe = Executable(script = "main.py", base= base)
    ```

1. CompilePython.batを実行しbatの指示に従ってください
1. buildというファイルの中にexeが生成されます。

* 注意  
  依存Packageが足りない場合exe実行時にエラーが出ます。



## This bat is an auxiliary bat for compiling arbitrary python files.

### Usage

1. Describe the dependent packages in pipPackages.txt.

1. Describe the python file you want to compile in setup.py.

    ``` python
    # script = Replace "main.py" with any file
    exe = Executable(script = "main.py", base= base)
    ```

1. Run CompilePython.bat and follow the instructions in the bat
1. An exe is generated in a file called build.

* Warning  
 If the dependent Package is missing, an error will occur during exe execution.
