# CMake

```cmake
# 添加一个名为project_name的目标库  默认为静态或对象库  SHARED：动态库
# 静态库 库信息直接编译进程序  删除静态库对编译好的程序没有影响
# 动态库 程序运行时将动态库加载 找不到动态库则程序不能运行
add_library(project_name
	file.h  file.cpp
)
# 向project_name添加源文件  
target_sources(project_name STATIC
	fileB.h fileB.cpp
)

# 指定目标包含的头文件路径
target_include_directories(project_name
	PUBLIC
	other_file.h
)
# 指定目标链接库
target_link_libraries(
	PUBLIC
	project_b
)
# 指定目标编译选项
target_compile_options()

add_executable()

enable_tesing()

add_test(NAME app COMMAND app -t 123)

# 添加子模块
add_subdirectory()
```

## 子模块实例

```shell
# 文件结构
├── build
├── CMakeLists.txt
├── main.cpp
├── module_1
│   ├── CMakeLists.txt
│   ├── module_1.cpp
│   └── module_1.h
├── module_2
│   ├── CMakeLists.txt
│   ├── module_2.cpp
│   └── module_2.h
└── module_3
    ├── CMakeLists.txt
    ├── module_3.cpp
    └── module_3.h
```

### main 

#### main.cpp

```cpp
#include <iostream>
#include "./module_1/module_1.h"
#include "./module_2/module_2.h"

using std::cout;
using std::endl;

int main(int argc,char** argv)
{
    module_1::fun1();
    module_2::fun2();
    return 0;
}
```

#### CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.12)
project(CMake_Demo VERSION "1.0.0")

add_subdirectory(module_1)
add_subdirectory(module_2)
add_subdirectory(module_3)

add_executable(demo
    main.cpp
)
target_link_libraries(demo
    module_1
    module_2
    module_3
)
```

### module_1

#### module_1.h

```cpp
#pragma once
#include <iostream>

namespace module_1
{
    void fun1();
}
```

#### CMakeLists.txt

```cmake
message("module_1---${PROJECT_SOURCE_DIR}")
add_library(module_1
    module_1.cpp
    module_1.h
)
```

### module_2

#### module.h

```cpp
#pragma once
#include "../module_3/module_3.h"
#include <iostream>

namespace module_2
{
void fun2();
}
```

#### CMakeLists.txt

```cmake
message("module_2---${PROJECT_SOURCE_DIR}")
add_library(module_2
    module_2.cpp
    module_2.h
)
target_link_libraries(module_2
    PUBLIC
    module_3
)
```

### module_3

#### module_3.h

```cpp
#pragma once

namespace module_3
{
const static int NUM_3=1024;
}
```

#### CMakeLists.txt

```cmake
message("module_3---${PROJECT_SOURCE_DIR}")
add_library(module_3
    module_3.cpp
    module_3.h
)
```

