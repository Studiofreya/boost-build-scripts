call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" x86

set cores=%NUMBER_OF_PROCESSORS%
echo Building boost with %cores% cores

cd boost_1_61_0
call bootstrap.bat

rem Most libraries can be static libs
b2 -j%cores% toolset=msvc-14.0 address-model=64 architecture=x86 link=static threading=multi runtime-link=shared --build-type=minimal stage --stagedir=stage/x64 
b2 -j%cores% toolset=msvc-14.0 address-model=32 architecture=x86 link=static threading=multi runtime-link=shared --build-type=minimal stage --stagedir=stage/win32

pause