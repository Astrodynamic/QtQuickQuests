qt_add_qml_module(${PROJECT_NAME}
    URI ${PROJECT_NAME}_Module
    VERSION 1.0
    NO_PLUGIN
    RESOURCE_PREFIX /astrodynamic.com/imports
    QML_FILES
        modules/Main.qml
)

add_subdirectory(modules)

set(QML_IMPORT_PATH
    ${CMAKE_BINARY_DIR}/modules
    CACHE STRING "" FORCE
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    BasicLibplugin
)

