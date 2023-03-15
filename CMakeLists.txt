cmake_minimum_required(VERSION 3.18)
project(kaleidoscope)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

set(AST_SOURCES 
        ast/BinaryExprAST.cpp
        ast/CallExprAST.cpp
        ast/FunctionAST.cpp
        ast/NumberExprAST.cpp
        ast/PrototypeAST.cpp
        ast/VariableExprAST.cpp)

set(KALEIDOSCOPE_SOURCES
        kaleidoscope/kaleidoscope.cpp)

set(LEXER_SOURCES
        lexer/lexer.cpp)

set(LOGGER_SOURCES
        logger/logger.cpp)

set(PARSER_SORUCES
        parser/parser.cpp)

include_directories(${PROJECT_SOURCE_DIR}
                    /usr/lib/llvm-15/include
                    /usr/include/c++/10/
                    /usr/include/x86_64-linux-gnu/
                    /usr/include/x86_64-linux-gnu/c++/10/)
link_directories(/usr/lib/llvm-15/lib)

add_executable(${PROJECT_NAME} 
                main.cpp
                ${AST_SOURCES}
                ${KALEIDOSCOPE_SOURCES}
                ${LEXER_SOURCES}
                ${LOGGER_SOURCES}
                ${PARSER_SORUCES})
target_link_libraries(${PROJECT_NAME} LLVM-15)
