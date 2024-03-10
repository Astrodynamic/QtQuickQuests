qt_add_library(CobotLib STATIC)

set_target_properties(CobotLib
  PROPERTIES
  AUTOMOC ON
)

find_package(Qt6 6.7 REQUIRED COMPONENTS
    Quick
    Quick3D
)

list(APPEND MODULE_QML_FILES
  CobotScene.qml
)

qt_add_qml_module(CobotLib
    URI Cobot
    VERSION 1.0
    RESOURCE_PREFIX /astrodynamic.com/imports
    QML_FILES
        ${MODULE_QML_FILES}
)

target_link_libraries(CobotLib
  PRIVATE
    Qt6::Quick
    Qt6::Quick3D
)
