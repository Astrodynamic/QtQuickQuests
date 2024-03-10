qt_add_library(BasicLib STATIC)

set_target_properties(BasicLib
  PROPERTIES
  AUTOMOC ON
)

find_package(Qt6 6.7 REQUIRED COMPONENTS
    Quick
)

list(APPEND MODULE_QML_FILES
  Constants.qml
  Theme.qml
)

list(APPEND MODULE_JS_FILES
  Utilities.js
)

set_source_files_properties(${MODULE_QML_FILES} PROPERTIES
    QT_QML_SINGLETON_TYPE  TRUE
)

qt_add_qml_module(BasicLib
    URI Basic
    VERSION 1.0
    RESOURCE_PREFIX /astrodynamic.com/imports
    QML_FILES
        ${MODULE_QML_FILES}
        ${MODULE_JS_FILES}
)

target_link_libraries(BasicLib
  PRIVATE
  Qt6::Quick
)
