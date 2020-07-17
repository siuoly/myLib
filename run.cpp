/* README
一般編譯需使用 g++ -g file.cpp -o file && file args....
這個程式讓命令縮短為  run file args...


ex:
編譯檔案: test.cpp 
額外參數 arg1 arg2
使用方法1: run test arg1 arg2       即可執行 
使用方法2: run test.cpp arg1 arg2   即可執行 
 */

#include<iostream>
using namespace std;

string getArgument(int n ,const char ** argv)
{
    string arg; int i = 2;
    while(n > 2)
    {
        arg += argv[i];
        arg +=" ";
        i++;
        n--;
    }

    return arg;
}

string getFileName(string name)
{

    // case: "f"
    if(name.size() <= 4)
        return name;

    // case: "file.cpp"
    if( name.substr(name.length()-4).compare( ".cpp" ) == 0 )
    {
        name = name.substr(0 , name.length()-4);
        return name;
    }

    // case: "file""
    return name;
}


int main(int argc, char const *argv[])
{   
    // if no file need compile
    if(argc ==1 )
    {
        cout << "no file need compile ";
        return 0;
    }

    // set cmd shell using "unicode charset"
    system("chcp 65001");


    // set parameter for system( .. )
    string sFile = getFileName(argv[1]);        // 編譯檔名
    string arg = getArgument(argc , argv);      // 執行參數    
    string command ;                            // 系統呼叫命令

    command = "g++ -g "  + sFile + ".cpp -o " +sFile  +" && " + sFile + " " + arg;

    std::cout << "compile " << argv[1] << ".cpp....." << endl;;
    cout << command.c_str() << endl << "............\n\n";


    system( command.c_str() );


    cout << "\n\n..........\nrun end";


    return 0;
}

/* 
g++ -g run.cpp -o run 
 */
