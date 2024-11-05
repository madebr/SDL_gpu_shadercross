set(required_vars)

if(WIN32)
    find_file(DirectXShaderCompiler_dxcompiler_BINARY NAMES "dxcompiler.dll" HINTS ${DirectXShaderCompiler_Hints})
    find_library(DirectXShaderCompiler_dxcompiler_LIBRARY NAMES "dxcompiler" "dxcompiler.lib" HINTS ${DirectXShaderCompiler_Hints})
    find_file(DirectXShaderCompiler_dxil_BINARY NAMES "dxil.dll" HINTS ${DirectXShaderCompiler_Hints})
    set(required_vars
        DirectXShaderCompiler_dxcompiler_BINARY
        DirectXShaderCompiler_dxcompiler_LIBRARY
        DirectXShaderCompiler_dxil_BINARY
    )
else()
    find_library(DirectXShaderCompiler_dxcompiler_LIBRARY NAMES "dxcompiler" HINTS ${DirectXShaderCompiler_Hints})
    find_library(DirectXShaderCompiler_dxil_LIBRARY NAMES "dxil" HINTS ${DirectXShaderCompiler_Hints})
    set(required_vars
        DirectXShaderCompiler_dxcompiler_LIBRARY
        DirectXShaderCompiler_dxil_LIBRARY
    )
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(DirectXShaderCompiler
    REQUIRED_VARS ${required_vars}
)

if(DirectXShaderCompiler_FOUND)
    if(NOT TARGET DirectXShaderCompiler::dxcompiler)
        add_library(DirectXShaderCompiler::dxcompiler IMPORTED SHARED)
        if(WIN32)
            set_property(TARGET DirectXShaderCompiler::dxcompiler PROPERTY IMPORTED_LOCATION "${DirectXShaderCompiler_dxcompiler_BINARY}")
            set_property(TARGET DirectXShaderCompiler::dxcompiler PROPERTY IMPORTED_IMPLIB "${DirectXShaderCompiler_dxcompiler_LIBRARY}")
        else()
            set_property(TARGET DirectXShaderCompiler::dxcompiler PROPERTY IMPORTED_LOCATION "${DirectXShaderCompiler_dxcompiler_LIBRARY}")
        endif()
    endif()
    if(NOT TARGET DirectXShaderCompiler::dxil)
        add_library(DirectXShaderCompiler::dxil IMPORTED SHARED)
        if(WIN32)
            set_property(TARGET DirectXShaderCompiler::dxil PROPERTY IMPORTED_LOCATION "${DirectXShaderCompiler_dxil_BINARY}")
        else()
            set_property(TARGET DirectXShaderCompiler::dxil PROPERTY IMPORTED_LOCATION "${DirectXShaderCompiler_dxil_LIBRARY}")
        endif()
    endif()
endif()
